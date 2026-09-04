require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false

  config.consider_all_requests_local = true
  config.server_timing = true

  config.public_file_server.enabled = true
  config.assets.debug = true

  config.active_storage.service = :local

  config.log_level = :debug
  config.logger = ActiveSupport::Logger.new($stdout)
end