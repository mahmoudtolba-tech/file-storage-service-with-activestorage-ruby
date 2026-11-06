source "https://rubygems.org"

ruby "3.2.2"

# Rails framework
gem "rails", "~> 7.1.0"

# Database
gem "pg", "~> 1.5"

# Redis client
gem "redis", "~> 4.8"

# File storage
gem "image_processing", "~> 1.14"
gem "mini_magick", "~> 4.11"

# Background jobs (optional for future)
gem "sidekiq", "~> 6.5"

# Environment variables
gem "dotenv-rails", groups: [:development, :test]

# Testing
group :development, :test do
  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails", "~> 6.4"
  gem "faker", "~> 3.2"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
end

# Use Puma as the app server
gem "puma", "~> 6.0"

# Use Active Storage variants
gem "aws-sdk-s3", "~> 1.129", require: false