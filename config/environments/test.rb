require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false

  config.consider_all_requests_local = true

  config.active_storage.service = :test

  config.public_file_server.enabled = true
  config.assets.compile = true

  config.log_level = :warn
  config.logger = ActiveSupport::Logger.new($stdout)
end