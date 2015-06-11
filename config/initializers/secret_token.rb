# PortfolioProject::Application.config.secret_key_base = ENV["RAILS_SECRET_KEY_BASE"]
PortfolioProject::Application.config.secret_token = ENV.fetch("RAILS_SECRET_KEY_BASE")
