# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FileStorageService
  class Application < Rails::Application
    config.load_defaults 7.1

    # Use Sidekiq for Active Job
    config.active_job.queue_adapter = :sidekiq

    # Configure Active Storage to use Amazon S3 in production
    config.active_storage.service = ENV.fetch("ACTIVE_STORAGE_SERVICE", "local").to_sym

    # Autoload paths for repository and service layers
    config.autoload_paths << Rails.root.join("app", "repositories")
    config.autoload_paths << Rails.root.join("app", "services")
  end
end