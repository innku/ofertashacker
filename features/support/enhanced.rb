Cucumber::Rails::World.use_transactional_fixtures = false
Capybara.default_driver = :selenium

Capybara.server_port = 3001
Before do
  DatabaseCleaner.clean
end
