require 'active_record'

module FileStorageService
  class Application
    def self.configure
      # Load database configuration
      ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
      ActiveRecord::Base.establish_connection(ENV['ENVIRONMENT'])

      # Configure active storage
      ActiveStorage::Engine.config.active_storage_service = :local
    end
  end
end

FileStorageService::Application.configure