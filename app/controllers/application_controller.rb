class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_company)
  end

  def after_sign_in_path_for(resource)
   company_path(current_company)
  end
 
end
