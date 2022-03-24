# frozen_string_literal: true

require 'rails_helper'

# Use the activity log player contact phone activity log implementation,
# since it includes the works_with concern

RSpec.describe 'Activity Log implementation', type: :model do
  include ModelSupport
  include PlayerContactSupport

  before :example do
    # SetupHelper.setup_al_player_contact_phones
    # ::ActivityLog.define_models
    create_user
    setup_access :player_contacts
    let_user_create_player_contacts
    create_item(data: rand(10_000_000_000_000_000), rank: 10)
  end

  it 'saves data into an activity log record' do
    data = @player_contact.data

    # Create a second user to ensure that the user attribute is set correctly on saving
    resource_name = :activity_log__player_contact_phone__primary
    user, = create_user
    @player_contact.master.current_user = user
    master = @player_contact.master
    expect(master.current_user).to eq user
    al = @player_contact.activity_log__player_contact_phones.build(select_call_direction: 'from player',
                                                                   select_who: 'user')
    expect(al.master_user).to eq user
    expect(master.activity_log__player_contact_phones).not_to be nil
    expect(al.current_definition).not_to be nil

    expect(al.player_contact).to eq @player_contact

    setup_access resource_name, resource_type: :activity_log_type, access: nil, user: @user

    # Validate that the new activity log item can not be accessed without the appropriate access control
    expect do
      al.save
    end.to raise_error FphsException

    setup_access :activity_log__player_contact_phones, resource_type: :table, access: :create,
                                                       user: al.current_user
    setup_access resource_name, resource_type: :activity_log_type, access: :create, user: al.current_user

    expect(al.current_user.has_access_to?(:create, :table, :activity_log__player_contact_phones)).to be_truthy
    expect(al.current_user.has_access_to?(:create, :activity_log_type, resource_name)).to be_truthy
    # The access has changed, reset the cached results
    al.reset_access_evaluations!

    let_user_create_player_contacts

    expect(al.save).to be true

    expect(al.master_id).to eq @player_contact.master_id
    al.reload
    # We expect data to match, based on an automatic sync of related fields

    expect(al.data).to eq PlayerContact.format_data(data, 'phone')
    expect(al.select_call_direction).to eq 'from player'
    expect(al.select_who).to eq 'user'
    expect(al.user_id).to eq user.id

    setup_access resource_name, resource_type: :activity_log_type, access: nil, user: @user

    expect(@user.has_access_to?(:access, :activity_log_type, resource_name)).to be_falsey

    expect { al.as_json }.to raise_error FphsException
  end

  context 'has extra log types defined' do
    before do
      create_user
      setup_access :player_contacts
      let_user_create_player_contacts
      create_item(data: rand(10_000_000_000_000_000), rank: 10)

      al_def = ActivityLog::PlayerContactPhone.definition
      al_def.extra_log_types = <<~ENDDEF
        step_1:
          label: Step 1
          fields:
            - select_call_direction
            - select_who

        step_2:
          label: Step 2
          fields:
            - select_call_direction
            - extra_text

      ENDDEF

      al_def.current_admin = @admin
      al_def.save!
      setup_access :activity_log__player_contact_phones, resource_type: :table, access: :create, user: @user
      setup_access :activity_log__player_contact_phone__blank, resource_type: :activity_log_type, access: :create, user: @user
      setup_access :activity_log__player_contact_phone__primary, resource_type: :activity_log_type, access: :create, user: @user
      setup_access :activity_log__player_contact_phone__step_1, resource_type: :activity_log_type, access: :create, user: @user
      setup_access :activity_log__player_contact_phone__step_2, resource_type: :activity_log_type, access: :create, user: @user
      al_def.reload
      al_def.option_type_config_for :step_1
      al_def.option_type_config_for :step_2
      al_def.add_master_association
    end

    it 'has a set of master associations pointing to the full table and individual extra log types' do
      data = @player_contact.data
      master = @player_contact.master
      expect(master).not_to be nil
      @player_contact.master.current_user = @user

      expect(master.activity_log__player_contact_phones.count).to eq 0
      expect(master.activity_log__player_contact_phone__primary.count).to eq 0
      expect(master.activity_log__player_contact_phone__blank_log.count).to eq 0
      expect(master.activity_log__player_contact_phone__step_1.count).to eq 0
      expect(master.activity_log__player_contact_phone__step_2.count).to eq 0

      @player_contact.activity_log__player_contact_phones.create!(select_call_direction: 'from player',
                                                                  select_who: 'user',
                                                                  master: master)

      expect(master.activity_log__player_contact_phones.reload.count).to eq 1
      expect(master.activity_log__player_contact_phone__blank_log.reload.count).to eq 1
      expect(master.activity_log__player_contact_phone__primary.reload.count).to eq 0
      expect(master.activity_log__player_contact_phone__step_1.reload.count).to eq 0
      expect(master.activity_log__player_contact_phone__step_2.reload.count).to eq 0

      @player_contact.activity_log__player_contact_phones.create!(select_call_direction: 'from player',
                                                                  select_who: 'user',
                                                                  master: master,
                                                                  extra_log_type: 'primary')

      expect(master.activity_log__player_contact_phones.reload.count).to eq 1
      expect(master.activity_log__player_contact_phone__blank_log.reload.count).to eq 1
      expect(master.activity_log__player_contact_phone__primary.reload.count).to eq 1
      expect(master.activity_log__player_contact_phone__step_1.reload.count).to eq 0
      expect(master.activity_log__player_contact_phone__step_2.reload.count).to eq 0

      al = @player_contact.activity_log__player_contact_phones.create!(select_call_direction: 'from player',
                                                                       select_who: 'user',
                                                                       extra_log_type: 'step_1',
                                                                       master: master)

      expect(master.activity_log__player_contact_phones.reload.count).to eq 2
      expect(master.activity_log__player_contact_phone__blank_log.reload.count).to eq 1
      expect(master.activity_log__player_contact_phone__primary.reload.count).to eq 1
      expect(master.activity_log__player_contact_phone__step_1.reload.count).to eq 1
      expect(master.activity_log__player_contact_phone__step_2.reload.count).to eq 0
    end
  end
end
