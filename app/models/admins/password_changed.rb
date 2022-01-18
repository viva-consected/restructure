# frozen_string_literal: true

module Admins
  class PasswordChanged
    class << self
      # Class attribute settings are set by the initializer message_notification_defaults.rb
      attr_accessor :defaults
    end

    # Set up the notification email after an admin changed the password
    # @param [Admin] admin
    def self.notify(admin)
      Rails.logger.info("Setting up the notification when an admin changed the password. Admin #{admin.email}")
      data = { email: admin.email }
      defaults = Admins::PasswordChanged.defaults
      HandleNotificationWithDataJob.perform_now(defaults, data, admin)
    end

  end
end
