# Load the Rails application
require_relative 'application'

# Initialize the Rails application
PortfolioProject::Application.initialize!

PROFILES = YAML.load_file("#{Rails.root}/config/featuredprofiles.yml")[Rails.env]
