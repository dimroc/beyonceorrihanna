require 'rubygems'
require 'spork'
require 'database_cleaner'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'ffaker'
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'remarkable/active_record'
  require 'factory_girl'
  require 'fixture_builder'
  require 'valid_attribute'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'capybara/firebug'
  require 'clearance/testing'
  require 'support/helpers'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.treat_symbols_as_metadata_keys_with_true_values = true
    #config.formatter = 'documentation'  # configured in .rspec

    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    config.include Helpers

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    config.global_fixtures = :all

    config.before(:each, firebug: true) do
      Capybara.current_driver = :selenium_with_firebug
    end

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each, :js) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
end

