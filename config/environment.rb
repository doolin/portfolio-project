# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PortfolioProject::Application.initialize!

PROFILES = YAML.load_file("#{Rails.root.to_s}/config/featuredprofiles.yml")[Rails.env]
#PROJECTS = YAML.load_file("#{Rails.root.to_s}/config/featuredprojects.yml")[Rails.env]
