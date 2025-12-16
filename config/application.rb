# Frozen string literal: true
require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module FileStorageService
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_storage.service = :amazon
  end
end