# frozen_string_literal: true

class HandleNotificationWithItemJob < ApplicationJob
  queue_as :default

  def perform(defaults, user, item = user)
    mn = Messaging::MessageNotification.create! user: user,
                                                recipient_user_ids: [user.id],
                                                layout_template_name: defaults[:layout],
                                                content_template_name: defaults[:content],
                                                message_type: :email,
                                                subject: defaults[:subject],
                                                item: item

    mn.handle_notification_now logger: Delayed::Worker.logger

  end

end
