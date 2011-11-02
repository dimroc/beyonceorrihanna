#require 'rubygems'
#require 'spork'
#
#Spork.prefork do
#  ENV["RAILS_ENV"] ||= 'test'
#  require File.expand_path("../../config/environment", __FILE__)
#  require 'rspec/rails'
#  require 'remarkable/active_record'
#  require 'clearance/testing'
#  require 'vcr'
#
#  VCR.config do |c|
#    c.cassette_library_dir = 'spec/cassettes'
#    c.stub_with :webmock
#    c.default_cassette_options = {:record => :new_episodes}
#    c.ignore_localhost = true
#  end
#
#  if ENV['HEADLESS'] == 'true'
#    require 'headless'
#
#    headless = Headless.new
#    headless.start
#
#    at_exit do
#      headless.destroy
#    end
#  end
#
#  Dir[Rails.root.join("spec/support/prefork/**/*.rb")].each { |f| require f }
#
#  RSpec.configure do |config|
#    config.mock_with :rspec
#    config.fixture_path = Rails.root.join("spec/fixtures").to_s
#    config.global_fixtures = :all
#    config.use_transactional_fixtures = true
#    config.include RequestHelpers, :type => :request
#    config.extend VCR::RSpec::Macros
#
#    config.before(:each) do
#      WebMock.disable! if example.metadata[:type] == :request
#    end
#
#    config.before(:each, firebug: true) do
#      Capybara.current_driver = :selenium_with_firebug
#    end
#
#    config.after(:each) do
#      WebMock.enable! if example.metadata[:type] == :request
#    end
#
#    config.extend WithModel
#  end
#
#  Capybara.default_wait_time = 5
#  Capybara.server_port = 61131
#end
#
#Spork.each_run do
#  Dir[Rails.root.join("spec/support/each_run/**/*.rb")].each { |f| require f }
#end
