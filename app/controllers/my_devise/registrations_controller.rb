class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource
    job = Job.find params[:job]
    resource.message = params[:user][:message]
    resource.name = params[:user][:name]
    if resource.save
      ContactMailer.contact(job, resource).deliver 
      set_flash_message :notice, :contact_notice
      sign_in_and_redirect(resource_name, resource)
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end
end 



