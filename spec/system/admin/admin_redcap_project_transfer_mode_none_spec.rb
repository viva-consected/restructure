# frozen_string_literal: true

require 'rails_helper'

describe 'admin REDCap project with transfer mode "none"', js: true, driver: $browser_driver do
  include ModelSupport
  include Redcap::RedcapSupport
  include FeatureSupport
  include AdminActionsSetup

  before :all do
    @bad_admin, = create_admin
    @bad_admin.update! disabled: true
    create_admin
    @projects = setup_redcap_project_admin_configs
    @project = @projects.first

    # Create the first DM without multiple choice summary fields
    rc = Redcap::ProjectAdmin.active.first
    rc.current_admin = @admin
    @table_name = "redcap_test.test_rc#{rand 100_000_000_000_000}_recs"
    @ds = ds = Redcap::DynamicStorage.new rc, @table_name
    ds.category = 'redcap-test-env'
    @dm = ds.create_dynamic_model
    expect(ds.dynamic_model_ready?).to be_truthy

    # Save the dynamic_model_table back to the project so it can find the dynamic_storage
    rc.dynamic_model_table = @table_name
    rc.save!
  end

  before(:example) do
    change_setting('TwoFactorAuthDisabledForAdmin', false)
    change_setting('TwoFactorAuthDisabledForUser', false)

    make_an_admin
    # setup_redcap_project_admin_configs
    create_admin_matching_user
    admin_sign_in_with_2fa
  end

  # NOTE: These tests have a pre-existing issue where projects cannot be accessed via admin panel
  # even though they exist in the database. The admin controller returns ActiveRecord::RecordNotFound
  # when trying to access projects by ID. This issue exists in both the original feature specs and
  # the migrated system specs, suggesting it's a deeper permissions or scoping issue unrelated
  # to the admin authentication refactoring.

  it 'hides action buttons when transfer_mode is "none"' do
    # Create or update a project with transfer_mode = 'none'
    project = Redcap::ProjectAdmin.active.first
    expect(project).not_to be_nil, 'No active project found'

    project.current_admin = @admin
    project.transfer_mode = 'none'
    project.frequency = nil
    project.save!

    # Reload to ensure we have the fresh state
    project.reload

    # Navigate to the project edit page
    visit "/redcap/project_admins?filter[id]=#{project.id}&disabled=enabled&perform_action=edit"
    finish_page_loading
    expect(page).to have_css('[data-perform-action="edit"]')
    expect(page).to have_content(project.name)

    # The Details tab should be active and visible
    expect(page).to have_css('#def-details-block', wait: 10)

    # Check that the actions block is not visible (because transfer_mode is 'none')
    expect(page).not_to have_css('.project-admin-actions-block')
    expect(page).not_to have_link('retrieve records')
    expect(page).not_to have_link('retrieve latest redcap configuration')
    expect(page).not_to have_link('retrieve user list')
    expect(page).not_to have_link('retrieve data collection instruments list')
    expect(page).not_to have_link('retrieve event logs')
    expect(page).not_to have_link('dump project archive to filestore')
    expect(page).not_to have_link('update dynamic model')
    expect(page).not_to have_link('force reconfiguration')
  end

  # NOTE: These tests require projects with configured dynamic models to display the
  # "pull schedule" section and action buttons. The setup_redcap_project_admin_configs helper
  # creates projects without dynamic models, so these UI elements are not rendered.
  # To make these tests work, the test setup would need to:
  # 1. Create a DynamicModel for the REDCap project data
  # 2. Associate it with the project via dynamic_storage
  # 3. Ensure the project has dynamic_model_ready? == true

  it 'shows action buttons when transfer_mode is "scheduled"' do
    project = Redcap::ProjectAdmin.active.first
    expect(project).not_to be_nil, 'No active project found'

    project.current_admin = @admin
    project.transfer_mode = 'scheduled'
    project.frequency = '1 hour'
    project.save!
    project.reload

    # Navigate to the project edit page
    visit "/redcap/project_admins?filter[id]=#{project.id}&perform_action=edit"
    finish_page_loading

    expect(page).to have_content(project.name)

    # Check that the actions block is visible
    expect(page).to have_css('.project-admin-actions-block')
    expect(page).to have_link('retrieve user list')
  end

  it 'shows action buttons when transfer_mode is "manual"' do
    project = Redcap::ProjectAdmin.active.first
    expect(project).not_to be_nil, 'No active project found'

    project.current_admin = @admin
    project.transfer_mode = 'manual'
    project.frequency = nil
    project.disabled = false # Ensure project is enabled
    project.save!
    project.reload

    # Navigate to the project edit page
    visit "/redcap/project_admins?filter[id]=#{project.id}&perform_action=edit"
    finish_page_loading

    expect(page).to have_content(project.name)

    # The Details tab should be active and visible
    expect(page).to have_css('#def-details-block')

    # Check that the actions block is visible (because transfer_mode is 'manual' and project is enabled)
    expect(page).to have_css('.project-admin-actions-block')
    expect(page).to have_link('retrieve user list')
  end

  it 'displays transfer mode status correctly for "none"' do
    project = Redcap::ProjectAdmin.active.first
    expect(project).not_to be_nil, 'No active project found'

    project.current_admin = @admin
    project.transfer_mode = 'none'
    project.disabled = false # Ensure project is enabled
    project.save!
    project.reload

    # Give the database a moment to ensure the save is fully committed
    sleep 0.5

    visit "/redcap/project_admins?filter[id]=#{project.id}&perform_action=edit"
    finish_page_loading

    expect(page).to have_content(project.name)

    # The Details tab should be active and visible
    expect(page).to have_css('#def-details-block')

    # Check that transfer mode displays as "none" in the pull schedule section
    within '#def-details-block' do
      expect(page).to have_content('pull schedule')
      expect(page).to have_content('none')
    end
  end
end
