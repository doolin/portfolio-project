source 'http://rubygems.org'

gem 'rake'
gem 'rails', '3.1.1'
gem 'sitemap_generator'
gem 'carrierwave'
gem 'fog'
gem 'zurb-foundation'

group :production do
  gem "pg"
end
 
group :development, :test do
  gem "sqlite3"
end

gem 'devise'
gem 'dynamic_form'
#gem 'friendly_id' # Looks cool, check into it later.
gem 'stringex'
gem 'gravatar_image_tag'
gem 'dalli'
gem 'possessive'
gem 'jquery-rails'
gem 'aws-s3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'escape_utils'

group :cucumber do
#  gem "builder", "~> 2.1.2"
  gem 'webrat'
#  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
end  

group :development do
  gem 'webrat'
  gem 'ruby-debug19'
  gem 'wrong'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'rb-fsevent'
end

group :postgresql do
  gem 'pg'
end

group :test do
  gem 'mock-aws-s3'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'webrat'
#  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'autotest'
  gem 'autotest-rails-pure'
#  gem 'autotest-fsevent'
  gem 'autotest-growl'
  gem 'spork'
# metric_fu
  #gem 'webrat', '0.7.2'
#  gem 'email_spec' 
end
