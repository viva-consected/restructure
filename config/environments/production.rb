require File.expand_path('../../lib/logger/do_nothing_logger.rb', __dir__)
require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  config.log_level = :fatal

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # No production encrypted credentials are secured by a master key in config/production.yml.enc
  # The SECRET_KEY_BASE environment variable must be set
  config.require_master_key = false

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :terser

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true
  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX
  config.action_dispatch.x_sendfile_header = ENV['FPHS_X_SENDFILE_HEADER'] || 'X-Accel-Redirect'

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Use a different cache store in production.
  config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment).
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "fpa1_production"

  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: ENV['SMTP_SERVER'],
    port: ENV['SMTP_PORT'],
    user_name: ENV['SMTP_USER_NAME'],
    password: ENV['SMTP_PASSWORD'],
    authentication: (ENV['SMTP_AUTHENTICATION_MODE'] || 'login').to_sym,
    enable_starttls_auto: true,
    # openssl_verify_mode: :peer,
    tls: true
  }

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  #  config.i18n.fallbacks = [I18n.default_locale]
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  config.log_level = if ENV['FPHS_LOG_LEVEL']
                       ENV['FPHS_LOG_LEVEL'].to_sym
                     else
                       :fatal
                     end

  case ENV['FPHS_USE_LOGGER']
  when 'TRUE', 'true', 'default'
    puts '!!!!!!!!!!!!!!!!!!!!!! Standard logger enabled !!!!!!!!!!!!!!!!!!!!!!'
    # Use default logging formatter so that PID and timestamp are not suppressed.
    config.log_formatter = ::Logger::Formatter.new
  when 'STDOUT'
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = ::Logger::Formatter.new
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  when 'syslog'
    # Use a different logger for distributed setups.
    puts '!!!!!!!!!!!!!!!!!!!!!! syslog enabled !!!!!!!!!!!!!!!!!!!!!!'
    require 'syslog/logger'
    config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new('restructure-app'))
  when 'DoNothing'
    puts '!!!!!!!!!!!!!!!!!!!!!! DoNothingLogger enabled !!!!!!!!!!!!!!!!!!!!!!'
    config.logger = DoNothingLogger.new
  else
    puts '!!!!!!!!!!!!!!!!!!!!!! Default (:fatal) logger   !!!!!!!!!!!!!!!!!!!!!!'
    config.log_level = :fatal
    config.log_formatter = ::Logger::Formatter.new
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.active_job.queue_adapter = :delayed_job
end
