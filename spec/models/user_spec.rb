# frozen_string_literal: true

require 'rails_helper'
include SetupHelper

describe User do
  include ModelSupport
  before(:each) do
    @user, @good_password = create_user
    @good_email = @user.email
  end

  subject { @user }

  #
  # Ensure the user instance is clean (including instance variables containing operational state)
  # so that a series of tests can be run in a single example block
  def reset_expiration_user
    @user = User.find(@user.id)
    @user.otp_required_for_login = false
    @user
  end

  describe 'associations' do
    it { is_expected.to have_one(:user_preference).inverse_of(:user).autosave(true) }
  end

  it 'creates a user' do
    new_user = User.where email: @good_email
    expect(new_user.first).to be_a User
  end

  it 'allows password change' do
    @user.password = @good_password + '&&!'
    expect(@user.save).to be true
  end

  it 'prevents email address change by a user' do
    # Get the user as if it is a standard user operation
    # The @user is the instance that was created by the admin
    # and therefore still acts like it has admin privileges
    new_user = User.where(email: @good_email).first
    expect(new_user.admin_set?).to be false

    new_user.email = 'testuser-change@testing.com'
    expect(new_user.save).to be false
  end

  it 'allows email address change by an admin' do
    create_admin
    @user.email = 'testuser-change@testing.com'
    @user.current_admin = @admin
    expect(@user.save).to be true
  end

  it 'prevents user disabled from authenticating' do
    create_admin
    @user.disabled = true
    @user.current_admin = @admin
    @user.save!

    expect(@user.active_for_authentication?).to be false
  end

  it 'prevents user changing disabled flag' do
    # Setup the user to be disabled
    @user.disabled = true
    @user.current_admin = @admin
    @user.save!

    # Get the user as if it is a standard user operation
    new_user = User.where(email: @good_email).first
    expect(new_user.admin_set?).to be false
    expect(new_user.disabled).to be true

    new_user.disabled = false
    expect(new_user.save).to be false
  end

  it 'prevents a user from reusing a recent password' do
    create_admin

    # Generate 7 new passwords - 0 to 6
    expect do
      7.times do |n|
        @user.password = "#{@good_password} #{n}"
        @user.save!
      end
    end.not_to raise_error

    @user.password = "#{@good_password} 3"
    expect(@user.save).to be false

    @user.password = "#{@good_password} 1"
    expect(@user.save).to be false

    @user.password = "#{@good_password} 0"
    expect(@user.save).to be true

    @user.password = @good_password.to_s
    expect(@user.save).to be true

    @user.password = "#{@good_password} 1"
    expect(@user.save).to be true

    @user.password = "#{@good_password} 1"
    expect(@user.save).to be false
  end

  it 'expires a password if it is too old' do
    create_admin

    # Expect the passport age limit to be set, and thus be a non-zero
    # While the default is 90 days, any positive number should be allowed
    expect(Settings::PasswordAgeLimit).to be_an_positive

    expect(@user.need_change_password?).to be_falsey

    @user.password_updated_at = DateTime.now - (Settings::PasswordAgeLimit - 1).days
    @user.current_admin = @admin
    @user.save

    expect(@user.need_change_password?).to be_falsey

    @user.password_updated_at = DateTime.now - (Settings::PasswordAgeLimit + 1).days
    @user.save

    expect(@user.need_change_password?).to be_truthy
  end

  describe 'create a user' do
    before do
      @registration_admin = SetupHelper.registration_admin
      stub_const('Settings::RegistrationAdminEmail', @registration_admin.email)
    end

    context 'when user NOT are allowed to self-register; i.e., AllowUsersToRegister is false' do
      before do
        stub_const('Settings::AllowUsersToRegister', false)
        Seeds.setup
      end
      it 'requires admin to create a user' do
        expect { User.create! email: "atest-#{@good_email}", first_name: 'Last', last_name: 'Last' }.to raise_error(
          ActiveRecord::RecordInvalid,
          'Validation failed: Admin account must be used to create user, Admin must exist'
        )
      end
      it 'is expected to be created by an admin' do
        expect do
          User.create!(email: "#{rand(100_000_000..1_099_999_999)}-atest-#{@good_email}",
                       current_admin: @admin,
                       first_name: 'First',
                       last_name: 'Last')
        end.to_not raise_error
      end
    end
    context 'when user are allowed to self-register; i.e., AllowUsersToRegister is true' do
      before do
        stub_const('Settings::AllowUsersToRegister', true)
        Seeds.setup
      end
      it 'is expected to be created by the self registering user' do
        expect do
          User.create!(email: "#{rand(100_000_000..1_099_999_999)}-atest-#{@good_email}",
                       password: 'AwDuHxX3LwhrfQyF',
                       current_admin: @registration_admin,
                       first_name: 'First',
                       last_name: 'Last')
        end.to_not raise_error
      end
      it 'is expected to be created by an admin' do
        expect do
          User.create!(email: "#{rand(100_000_000..1_099_999_999)}-atest-#{@good_email}",
                       current_admin: @admin,
                       first_name: 'First',
                       last_name: 'Last')
        end.to_not raise_error
      end
    end
  end

  it 'sets a password expiration reminder if the password is reset or changed' do
    Delayed::Worker.delay_jobs = false
    Messaging::MessageNotification.delete_all
    expect(Messaging::MessageNotification.layout_template(Users::Reminders.password_expiration_defaults[:layout])).to be_a Admin::MessageTemplate

    create_admin

    @user = User.new email: "#{@user.email}-allow-test-email", current_admin: @admin, first_name: 'fn', last_name: 'ln'

    @user.otp_required_for_login = false

    # Can't just stub the password_updated_at method to test, since the object is reloaded in the delayed_job job
    # So we create an alias, change the method, then use the alias to put the original method back afterwards.
    @user.class.send :alias_method, :orig_password_updated_at, :password_updated_at

    # Set the time so that it is too late for repeated reminders to be sent, since without an actual delay from
    # a future delayed job, the repeats will happen indefinitely.
    @user.class.send(:define_method, :password_updated_at) do
      Time.now - (Settings::PasswordAgeLimit - 3).days
    end

    @user.save!
    reset_expiration_user

    expect(User.expire_password_after).to eq Settings::PasswordAgeLimit
    expect(User.remind_days_before).to eq 15
    expect(User.remind_repeat_days).to eq 4

    message_count = Messaging::MessageNotification.count
    expect(Messaging::MessageNotification.first.user).to eq @user
    expect(Messaging::MessageNotification.first.layout_template_name).to eq Users::Reminders.password_expiration_defaults[:layout]
    # The content of the email should be generated to include the actual time remaining for this user's password
    expect(Messaging::MessageNotification.first.generated_content).to include 'Your password will expire in the next 3 days.'

    @user.password = 'Some new password that needs notification 2'
    @user.save!

    reset_expiration_user

    # A new job was added and processed, leading to a new notification record being added
    expect(Messaging::MessageNotification.count).to eq(message_count + 1)
    expect(Messaging::MessageNotification.last.user).to eq @user
    expect(@user.expires_in).to eq 3
    expect(Messaging::MessageNotification.last.layout_template_name).to eq Users::Reminders.password_expiration_defaults[:layout]
    # The content of the email should be generated to include the actual time remaining for this user's password
    expect(Messaging::MessageNotification.last.generated_content).to include 'Your password will expire in the next 3 days.'

    # Now reset the method that we used to test the expiration back to the original setup. This means that
    # the user will no longer have a password that is about to expire.
    # When we save the new password a new job will still be set to send in the future, but the message will not be created
    @user.password = 'some new password that needs notification 2'
    @user.class.send :alias_method, :password_updated_at, :orig_password_updated_at

    Delayed::Worker.delay_jobs = true
    @user.save!
    Delayed::Worker.delay_jobs = false
    # A new notification will have been set to send in the future (as a new job)
    expect(Delayed::Job.count).to eq 1
    # No new message has been created yet, since it is not created until the job is processed, which is way in the future
    expect(Messaging::MessageNotification.count).to eq(message_count + 1)
  ensure
    Delayed::Worker.delay_jobs = false
  end

  after :all do
    if User.new.respond_to? :orig_password_updated_at
      User.send :alias_method, :password_updated_at, :orig_password_updated_at
    end
  end
end
