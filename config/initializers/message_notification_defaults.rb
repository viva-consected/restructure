# frozen_string_literal: true

Rails.application.config.to_prepare do
  Users::Confirmations.defaults = {
    content: 'server registration confirmation',
    layout: 'server registration confirmation',
    subject: 'Registration Confirmation Notification'
  }

  Users::PasswordRecovery.defaults = {
    content: 'server password reset instructions',
    layout: 'server password reset instructions',
    subject: 'Password Reset Instructions'
  }

  Users::PasswordChanged.defaults = {
    content: 'server password changed',
    layout: 'server password changed',
    subject: 'Password Changed'
  }

  Admins::PasswordChanged.defaults = Users::PasswordChanged.defaults
end
