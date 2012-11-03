source 'http://rubygems.org'

gem 'rails', '3.2.3'

gem 'twitter'
gem 'devise', '1.5.3'
gem 'cancan'
gem "nifty-generators"
gem 'paperclip'
gem 'aws-sdk'
gem 'metropoli', :git => 'git://github.com/innku/metropoli.git'
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

group :assets do
  gem 'sass-rails',  "~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>= 1.0.3'
end

group :production, :staging do
  gem 'pg'
end

group :development, :test, :staging do 
  gem 'factory_girl_rails'
end

group :development, :test do 
  gem 'capybara', '1.1.1'
  gem 'database_cleaner'
  gem 'rspec-rails', '2.8.1'
  gem 'spork'
  gem 'launchy'
  gem "debugger"
  gem "selenium-webdriver"
  gem 'sqlite3'
end

group :test do
  gem 'cucumber-rails'
end
