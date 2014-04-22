class ApplicationController < ActionController::Base
  before_filter :store_location
  protect_from_forgery
  before_filter :ensure_domain

  APP_DOMAIN = 'www.ofertashacker.com'

  def ensure_domain
    if Rails.env == 'production' && request.env['HTTP_HOST'] != APP_DOMAIN
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = I18n.t('flash.alert.access_denied')
    if current_company 
      redirect_to root_path
    else
      redirect_to new_company_session_path
    end
  end

  def after_sign_in_path_for(resource)
    if params[:new_company] 
      new_job_path(:just_registered => true) 
    elsif params[:job_id]
      job_path(Job.find(params[:job_id]), :open_lightbox => true )
    else
      super
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_company)
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/companies/entrar" &&
        request.fullpath != "/companies/salir" &&
        request.fullpath != "/companies/password")
      if request.format == "text/html" || request.content_type == "text/html"
        session[:previous_url] = request.fullpath
        session[:last_request_time] = Time.now.utc.to_i
      end
    end
  end

  def after_sign_in_path_for(resource)
    if session[:previous_url] && session[:last_request_time] && session[:last_request_time] > 15.minutes.ago.utc.to_i
        session[:previous_url]
    else
      root_path
    end
  end
end


