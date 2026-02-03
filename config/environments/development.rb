Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are no repo sources configured.
  # config.active_job.queue_adapter     = :async
  config.active_job.queue_adapter     = :sidekiq

  # Debug mode disables concatenation and caching of assets.
  # This can cause significant delays in view rendering with large number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset pipeline (Production only).
  # config.assets.quiet = true

  # Raises error if missing translation
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously discover changes to source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end