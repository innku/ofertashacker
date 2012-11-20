Konacha.configure do |config|
  config.spec_dir    = "spec/javascripts"
  config.driver      = :selenium
  config.stylesheets = %w(application)
end if defined?(Konacha)
