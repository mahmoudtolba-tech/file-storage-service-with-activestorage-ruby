require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module FileStorageService
  class Application < Rails::Application
    config.load_defaults 7.1

    # Use Sidekiq for Active Job
    config.active_job.queue_adapter = :sidekiq

    # Enable Active Storage with local and S3 service (configured via env)
    config.active_storage.service = :local

    # Autoload paths for service and repository layers
    config.eager_load_paths << Rails.root.join("app/services")
    config.eager_load_paths << Rails.root.join("app/repositories")
  end
end