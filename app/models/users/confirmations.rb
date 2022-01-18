# frozen_string_literal: true

module Users
  class Confirmations
    class << self
      # Class attribute settings are set by the initializer message_notification_defaults.rb
      attr_accessor :defaults
    end

    # Set up the notification email after a user registers
    # @param [User] user
    def self.notify(user)
      Rails.logger.info('Setting up the confirmation notification after the user registers.')
      defaults = Users::Confirmations.defaults
      HandleNotificationWithItemJob.perform_now(defaults, user)
    end
  end
end
