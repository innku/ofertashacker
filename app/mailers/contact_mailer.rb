class ContactMailer < ActionMailer::Base
  def contact(job, name, email, message, file=nil)
    @job = job
    @name = name
    @email = email
    @message = message
    (attachments[file.original_filename] = File.read file.path) if file
    mail(:to=>"chinog9@gmail.com",:from=>job.company.email, :subject=>"[#{email}] Prueba" )
  end
end
