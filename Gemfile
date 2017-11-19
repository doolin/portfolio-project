# frozen_string_literal: true
source 'http://rubygems.org'

gem 'rails', '5.1.4'
gem 'rake'
gem 'sitemap_generator'
# gem 'carrierwave'
# gem 'fog'
gem 'dalli'
gem 'devise'
gem 'devise-encryptable'
gem 'dynamic_form'
gem 'gravatar_image_tag'
gem 'jquery-rails'
gem 'possessive'
gem 'stringex'
gem 'zurb-foundation'
# gem 'aws-s3'
gem 'escape_utils'
gem 'haml-rails'
gem 'thin'
gem 'public_suffix'
gem 'validate_url'
gem 'listen'

gem 'strong_migrations'

gem 'brakeman'
gem 'rubocop'

# Gems used only for assets and not required
# in production environments by default.
# group :assets do
gem 'coffee-rails'
gem 'sass-rails'
gem 'uglifier'
# end

group :production do
  gem 'pg'
end

# group :development, :test do
gem 'awesome_print'
gem 'pry'
gem 'pry-nav'
gem 'pry-rails'
gem 'rb-fsevent'
gem 'sqlite3'
gem 'xray-rails'
# end

gem 'simplecov', require: false, group: :test

group :cucumber do
  # cucumber-rails provide a generator for installing the
  # relevant cucumber files. It's worth having around to
  # ensure the configuration stays up to date as cucumber
  # is developed. At the moment, it requires rails < 5.1,
  # so it's temporarily commented out.
  gem 'cucumber-rails'
  gem 'database_cleaner'
end

group :test do
#   gem 'mock-aws-s3'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'rails-controller-testing' # consider getting rid of this later
  gem 'rspec'
  gem 'rspec-rails'
  gem 'capybara'
end
