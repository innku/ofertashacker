class ApplicationController < ActionController::Base
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
    flash[:alert] = 'No estas autorizado para ver esta página'
    if current_company 
      redirect_to root_path
    else
      redirect_to new_company_session_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if params[:job_id] && params[:sign_in]
      job_path(Job.find(params[:job_id]), :open_lightbox => true, :sign_in => true )
    elsif params[:job_id]
      job_path(Job.find(params[:job_id]), :open_lightbox => true )
    else
      super
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
end


