# Main application entry point
require 'dotenv/load'
require 'active_record'
require_relative 'config/application'

module FileStorageService
  class Application < ActiveRecord::Base
    def self.start
      # Initialize services
      repository = FileRepository.new
      service = FileService.new(repository: repository)

      # Start the server
      Rack::Server.start(
        app: FileStorageService::API.new(service: service),
        server: 'webrick',
        Host: '0.0.0.0',
        Port: ENV['PORT']
      )
    rescue StandardError => e
      # Log and exit on fatal error
      puts "Fatal error: #{e.message}"
      exit 1
    end
  end
end

FileStorageService::Application.start