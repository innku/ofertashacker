require_relative 'capybara_email'
require 'cucumber/rails'

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :truncation

# More speed
Capybara.automatic_reload = false
Capybara.server_port = 3001
Capybara.default_host = "localhost:3001"
Capybara.app_host = "http://localhost:3001"
