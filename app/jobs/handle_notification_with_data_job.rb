# frozen_string_literal: true

class HandleNotificationWithDataJob < ApplicationJob
  queue_as :default

  def perform(defaults, data = {}, *recipients)
    recipient_data = recipients.map(&:email)
    mn = Messaging::MessageNotification.create! recipient_data: recipient_data,
                                                layout_template_name: defaults[:layout],
                                                content_template_name: defaults[:content],
                                                message_type: :email,
                                                subject: defaults[:subject],
                                                data: data

    mn.handle_notification_now logger: Delayed::Worker.logger
  end
end
