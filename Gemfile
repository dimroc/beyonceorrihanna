source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'compass'
gem 'compass-960-plugin'
gem 'clearance'
gem 'haml-rails'
gem 'batman-rails'
gem 'bourbon'
gem 'grape', '~> 0.1.5'
gem 'sprockets'

gem 'sqlite3'
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'
gem 'thin-rails'

# Deploy with Capistrano
# gem 'capistrano'

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
  gem 'ruby-debug19', require: true
end

group :development, :test do
  #gem 'factory_girl_rails'
  #gem 'fixture_builder'
  gem 'ffaker'
  gem 'jslint_on_rails'
  gem 'rspec-rails'
end

group :production, :staging do
  gem 'newrelic_rpm'
end
