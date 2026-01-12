# Load environment variables from .env file
require 'dotenv/load'

# Require necessary dependencies
require 'active_storage'
require 'active_record'

# Configure Active Record
module Config
  class Application < Rails::Application
    config.active_storage.service = :local
    config.active_record.database = 'file_storage_service_development'
    config.active_record.host = ENV['DATABASE_HOST']
    config.active_record.username = ENV['DATABASE_USERNAME']
    config.active_record.password = ENV['DATABASE_PASSWORD']

    # Enable dependency injection
    config.dependency_injection = true

    # Set logging level
    config.log_level = :debug
  end
end