# frozen_string_literal: true

module Users
  class PasswordChanged
    class << self
      # Class attribute settings are set by the initializer message_notification_defaults.rb
      attr_accessor :defaults
    end

    # Set up the notification email when the user tries to change the password
    # @param [User] user
    def self.notify(user)
      Rails.logger.info("Setting up the notification when a user tries to change the password. User #{user.email}")
      defaults = Users::PasswordChanged.defaults
      HandleNotificationWithItemJob.perform_now(defaults, user)
    end
  end
end
