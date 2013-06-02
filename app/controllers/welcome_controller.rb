class WelcomeController < ApplicationController
  def about
  end

  def terminos
  end

  def privacidad
  end

  def codigo
    Innsights.report('Ver OpenSource').run
  end

  def licencia
  end
end
