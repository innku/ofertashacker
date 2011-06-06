class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    @job = Job.find params[:job]
    build_resource
    resource.message = params[:user][:message]
    resource.name = params[:user][:name]

    if recaptcha_valid?
      if resource.save
        ContactMailer.contact(@job, resource).deliver 
        set_flash_message :notice, :contact_notice
        sign_in_and_redirect(resource_name, resource)
      else
        clean_up_passwords(resource)
        redirect_to job_path(@job, :open_lightbox => true)
      end
    else
      clean_up_passwords(resource)
      render :template => 'jobs/show'
    end
  end


end 



