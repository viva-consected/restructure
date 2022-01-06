# frozen_string_literal: true

require 'rails_helper'

describe 'user sign in process for users that can self register', js: true, driver: :app_firefox_driver do
  include ModelSupport

  before(:all) do
    Settings::AllowUsersToRegister = true
    Rails.application.reload_routes!
    Rails.application.routes_reloader.reload!

    SetupHelper.feature_setup

    Settings::TwoFactorAuthDisabled = false

    create_admin

    # create a template user with some roles
    @template_user = RegistrationHandler.registration_template_user
    unless @template_user
      tue = Settings::DefaultUserTemplateEmail
      @template_user, = create_user(nil, '', email: tue, with_password: true, no_password_change: true)
    end
    at1 = @template_user.app_type_id
    expect(at1).not_to be nil

    @template_user.user_roles.each { |r| r.update(disabled: true, current_admin: @admin) }
    @template_user.user_roles.create!(current_admin: @admin, role_name: 'template role 1', app_type_id: at1)
    @template_user.user_roles.create!(current_admin: @admin, role_name: 'template role 2', app_type_id: at1)

    # create a user, then disable it
    @d_user, @d_pw = create_user(rand(100_000_000..1_099_999_999), '', with_password: true, no_password_change: true)
    expect(@d_user).to be_a User
    expect(@d_user.id).to equal @user.id
    @d_email = @d_user.email

    @d_user.current_admin = @admin
    @d_user.send :setup_two_factor_auth
    @d_user.new_two_factor_auth_code = false
    @d_user.otp_required_for_login = true
    @d_user.disabled = true
    @d_user.save!
    expect(@d_user.active_for_authentication?).to be false

    @user, @good_password = create_user(rand(100_000_000..1_099_999_999), '', with_password: true, no_password_change: true)
    @good_email = @user.email

    @user.current_admin = @admin
    @user.send :setup_two_factor_auth
    @user.new_two_factor_auth_code = false
    @user.otp_required_for_login = true
    @user.save!
  end

  it 'should sign in' do
    user = User.where(email: @good_email).first
    expect(user).to be_a User
    expect(user.id).to equal @user.id

    # login_as @user, scope: :user
    otp = @user.current_otp
    expect(otp).not_to be nil

    visit '/users/sign_in'
    within '#new_user' do
      fill_in 'Email', with: @good_email
      fill_in 'Password', with: @good_password
      fill_in 'Two-Factor Authentication Code', with: otp
      click_button 'Log in'
    end

    expect(page).to have_css '.flash .alert', text: '× Signed in successfully'
  end

  it 'should prevent sign in if user disabled' do
    visit '/users/sign_in'
    within '#new_user' do
      fill_in 'Email', with: @d_email
      fill_in 'Password', with: @d_pw
      fill_in 'Two-Factor Authentication Code', with: @d_user.current_otp
      click_button 'Log in'
    end

    expect(page).to have_css '.flash .alert', text: '× This account has been disabled.'
  end

  it 'should prevent invalid sign in' do
    user = User.where(email: @good_email).first
    expect(user).to be_a User
    expect(user.id).to equal @user.id

    # login_as @user, scope: :user

    visit "/admins/sign_in?secure_entry=#{SecureAdminEntry}"
    within '#new_admin' do
      fill_in 'Email', with: @good_email
      fill_in 'Password', with: ''
      fill_in 'Two-Factor Authentication Code', with: @user.current_otp

      click_button 'Log in'
    end

    fail_message = '× Invalid email, password or two-factor authentication code.'

    expect(page).to have_css 'input:invalid'

    visit "/admins/sign_in?secure_entry=#{SecureAdminEntry}"
    within '#new_admin' do
      fill_in 'Email', with: @good_email
      fill_in 'Password', with: @good_password + ' '
      fill_in 'Two-Factor Authentication Code', with: @user.current_otp

      click_button 'Log in'
    end

    expect(page).to have_css '.flash .alert', text: fail_message

    visit "/admins/sign_in?secure_entry=#{SecureAdminEntry}"
    within '#new_admin' do
      fill_in 'Email', with: @good_email
      fill_in 'Password', with: ' ' + @good_password
      fill_in 'Two-Factor Authentication Code', with: @user.current_otp

      click_button 'Log in'
    end

    expect(page).to have_css '.flash .alert', text: fail_message
  end

  after(:all) do
    Settings::AllowUsersToRegister = false
  end
end