Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application configuration.
  config.eager_load = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to asset pipelining when a precompiled asset is missed.
  config.assets.compile = false

  # `config.assets.precompile` and `config.assets.version` to change the locations of the compiled assets.
  config.assets.precompile = ['application.css', 'application.js']

  # Enable serving of images, stylesheets, and JavaScripts from the `/public`
  # directory. Also enable fallback to asset pipelining when a precompiled asset
  # is missed.
  # config.assets.configure do |env|
  #   env.cache = ActiveSupport::Cache::MemoryStore.new
  # end

  # Set to :debug to see everything that's happening.
  # This will cause a large slowdown in production.
  config.log_level = :debug

  # Use a logger that does not include timestamp information.
  # config.log_tags = [ :request_id ]
  config.log_tags = [:request_id]

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and/or Sidekiq/Capistrano). 
  # config.active_job.queue_adapter     = :sidekiq
  config.active_job.queue_adapter = :sidekiq

  # Ignore bad email addresses and do not raise email delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any region fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notifications to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema = false
end