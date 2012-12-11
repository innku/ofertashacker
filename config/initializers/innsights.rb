# encoding: UTF-8
# Extensive Docs at http://github.com/innku/innsights-gem

if Rails.env.development? || Rails.env.test?
  Innsights.credentials({ app: 'app', token: 'sometoken' })
end

Innsights.setup do

  user Company do
    display :title
  end

  watch Company do
    report 'Nueva Compañia'
    user lambda { |company| company }
  end

  watch Job do
    report 'Nueva oferta'
    user :company
    group :city
  end

  config :test do
    enable false
  end

  config :development do
    enable false
  end
end
