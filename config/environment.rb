# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PortfolioProject::Application.initialize!

Sass::Plugin.options[:template_location] = { 'app/stylesheets' => 'public/stylesheets' }
