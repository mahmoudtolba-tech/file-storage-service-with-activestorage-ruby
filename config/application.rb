require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FilestorageService
  class Application < Rails::Application
    config.load_defaults 7.1

    # Use environment variables for configuration
    config.active_storage.service = ENV.fetch("ACTIVE_STORAGE_SERVICE", "local").to_sym

    # Enable Redis cache store if REDIS_URL is present
    if ENV["REDIS_URL"]
      config.cache_store = :redis_cache_store, { url: ENV["REDIS_URL"] }
    end

    # Use sidekiq for ActiveJob (optional, future‑proof)
    config.active_job.queue_adapter = :sidekiq if defined?(Sidekiq)

    # Logging
    config.log_level = :debug
    config.log_tags = [:request_id]

    # Eager load lib folder (repositories, services)
    config.eager_load_paths << Rails.root.join("app", "repositories")
    config.eager_load_paths << Rails.root.join("app", "services")
  end
end