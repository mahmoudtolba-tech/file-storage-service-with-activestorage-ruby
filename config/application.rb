require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module FileStorageService
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, defaults to the values below.
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed last.
    #
    config.time_zone = "UTC"
    config.active_storage.service = :local

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end
  end
end