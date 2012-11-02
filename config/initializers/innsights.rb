# encoding: UTF-8
# Extensive Docs at http://github.com/innku/innsights-gem

Innsights.setup do

  user Company do
    display :title
  end

  watch Company do
    report 'Nueva Compañia'
  end

  watch Job do
    report 'Nueva oferta'
    user :company
  end

  config :test do
    enable false
  end

end
