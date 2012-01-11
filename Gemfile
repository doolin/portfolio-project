source 'http://rubygems.org'

gem 'rake'
gem 'rails', '3.1.1'
gem 'sitemap_generator'
gem 'carrierwave'
gem 'fog'
gem 'zurb-foundation'
gem 'devise'
gem 'dynamic_form'
gem 'stringex'
gem 'gravatar_image_tag'
gem 'dalli'
gem 'possessive'
gem 'jquery-rails'
gem 'aws-s3'
gem 'escape_utils'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end


group :production do
  gem "pg"
end
 
group :development, :test do
  gem "sqlite3"
  gem 'ruby-debug19' unless ENV["CI"]
  gem 'rb-fsevent'
end

gem 'simplecov', :require => false, :group => :test


group :cucumber do
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'spork', '~> 0.9.0.rc'
  gem 'launchy'    # So you can do Then show me the page
end


group :test do
  gem 'mock-aws-s3'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'autotest'
  gem 'autotest-rails-pure'
  gem 'autotest-growl'
  gem 'spork', '~> 0.9.0.rc'
end
