source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Rails
gem 'rails', '~> 7.1.0'

# Database
gem 'pg', '>= 0.18', '< 2.0'

# Active Storage dependencies
gem 'image_processing', '~> 1.2'

# Background jobs
gem 'sidekiq'

# Environment variables
gem 'dotenv-rails'

# Testing
group :development, :test do
  gem 'rspec-rails', '~> 6.0'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
end

# Linting
group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end