Cucumber::Rails::World.use_transactional_fixtures = false
Capybara.default_driver = :selenium
Capybara.server_port = 3001
Capybara.default_host = "localhost"

Before do
  DatabaseCleaner.clean
  Capybara.app_host = "http://localhost:#{Capybara.server_port}"
  page.driver.browser.manage.window.maximize
end

