Rails.application.configure do
  config.logger = ActiveSupport::Logger.new('log/development.log')
  config.logger.level = :debug
end