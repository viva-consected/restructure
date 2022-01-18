# frozen_string_literal: true

module Users
  class PasswordRecovery
    class << self
      # Class attribute settings are set by the initializer message_notification_defaults.rb
      attr_accessor :defaults
    end

    # Set up the notification email when the user tries to reset the password
    # @param [User] user, [HashMap] options
    def self.notify(user, options)
      Rails.logger.info("Setting up the notification when a user tries to reset the password. User #{user.email}")
      data = { email: user.email, reset_password_hash: options[:reset_password_hash] }
      defaults = Users::PasswordRecovery.defaults
      HandleNotificationWithDataJob.perform_now(defaults, data, user)
    end
  end
end
