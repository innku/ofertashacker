class ContactMailer < ActionMailer::Base
  def contact(job, name, email, message, file=nil)
    to = get_to(job.company.email, email)
    @job = job
    @name = name
    @email = email
    @message = message
    (attachments[file.original_filename] = File.read file.path) if file
    mail(:to=>to,:from=>"robot@ofertashacker.com", :reply_to => @email, :subject=>"[OfertasHacker] Nuevo interesado en tu vacante" )
  
  end

  private

  def get_to company_email, user_email
    if Rails.env.production?
      company_email
    else
      user_email
    end
  end
end
