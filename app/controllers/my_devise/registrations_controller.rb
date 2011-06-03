class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    job = Job.find params[:job]
    if recaptcha_valid?
      build_resource
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
    else
      redirect_to job
    end
  end


end 



