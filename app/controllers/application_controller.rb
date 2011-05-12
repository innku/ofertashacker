class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'No estas autorizado para ver esta página'
    redirect_to new_company_session_path
  end

  def after_sign_in_path_for(resource)
    params[:new_company] ? new_job_path : super
  end

  def current_ability
    @current_ability ||= Ability.new(current_company)
  end 
end
