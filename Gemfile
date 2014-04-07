source 'http://rubygems.org'

gem 'rails', '3.2.11'

gem 'twitter'
gem 'devise', '1.5.3'
gem 'cancan'
gem "nifty-generators"
gem 'paperclip'
gem 'aws-sdk'
gem 'metropoli', :github => 'e3matheus/metropoli', :branch => 'feature_country_and_cities_autocomplete'
gem "mocha", :group => :test
gem 'RedCloth'
gem "will_paginate"
gem 'hoptoad_notifier'
gem 'bitly'
gem "rake", "0.9.2"
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'thin'
gem 'innsights', :github => "innku/innsights-gem"
gem 'koala'

group :assets do
  gem 'sass-rails',  "~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>= 1.0.3'
end

group :production, :staging do
  gem 'pg'
  gem 'newrelic_rpm'
end

group :development, :test, :staging do 
  gem 'factory_girl_rails'
end

group :development, :test do 
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-rails', '2.8.1'
  gem 'spork'
  gem 'launchy'
  gem "debugger"
  gem "selenium-webdriver", "~> 2.38.0"
  gem 'sqlite3'
  gem 'konacha'
end

group :test do
  gem 'cucumber-rails'
end
