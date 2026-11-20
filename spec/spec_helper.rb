# frozen_string_literal: true

require "simplecov"
SimpleCov.start "rails" do
  add_filter "/spec/"
end

RSpec.configure do |config|
  # Use the documentation formatter for detailed output
  config.formatter = :documentation

  # rspec-expectations config
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Disable RSpec's monkey patching
  config.disable_monkey_patching!

  # Run specs in random order to surface order dependencies.
  config.order = :random
  Kernel.srand config.seed
end