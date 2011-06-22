class ContactMailer < ActionMailer::Base
  def contact(job, name, email, message)
    @job = job
    @name = name
    @email = email
    @message = message
    mail(:to=>"chinog9@gmail.com",:from=>job.company.email, :subject=>"[#{email}] Prueba" )
  end
end
