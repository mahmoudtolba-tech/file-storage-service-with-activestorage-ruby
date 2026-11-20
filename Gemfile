source "https://rubygems.org"

ruby "3.2.2"

# Rails framework
gem "rails", "~> 7.1.0"

# Database
gem "pg", ">= 1.5", "< 2.0"

# Redis for caching / sidekiq (future)
gem "redis", "~> 4.8"

# File uploads
gem "image_processing", "~> 1.2"
gem "aws-sdk-s3", "~> 1.121" # If using S3 in production (optional)

# Background jobs (optional)
gem "sidekiq", "~> 6.5"

# Testing
group :development, :test do
  gem "rspec-rails", "~> 6.1"
  gem "factory_bot_rails", "~> 6.3"
  gem "faker", "~> 3.2"
  gem "pry-rails", "~> 0.3.9"
end

# Linting / code quality
group :development do
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
end

# Environment variable handling
gem "dotenv-rails", groups: [:development, :test]