source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'pg'
gem 'haml'
gem 'haml-rails'
gem 'thin-rails'
gem 'jquery-rails'

gem 'clearance'
gem 'batman-rails'
gem 'bourbon'
gem 'simple_form'
gem 'friendly_id', '~>4.0.0.beta14'

gem 'sass-rails',   '~> 3.1.4'
gem 'coffee-rails', '~> 3.1.1'
gem 'uglifier', '>= 1.0.3'
gem 'compass', '~>0.12.alpha.0'
gem 'compass-960-plugin'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

group :test do
  gem 'capybara'
  gem 'capybara-firebug', require: "capybara/firebug"
  gem 'headless', require: false
  gem 'selenium-webdriver', '2.8.0'
  # Pretty printed test output
  gem 'turn', :require => false
end

group :development do
  gem 'growl_notify', require: false
  gem 'guard', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
  gem 'heroku'
  gem 'kumade'
  gem 'ruby-debug19', require: false
  gem 'rails_best_practices'
end

group :development, :test do
  gem 'fixture_builder'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'jslint_on_rails'
  gem 'rspec'
  gem 'rspec-rails'
  gem "remarkable_activerecord", "~> 4.0.0.alpha4", require: false
  gem 'valid_attribute'
  gem 'wirble'
end

group :production, :staging do
  gem 'newrelic_rpm'
end
