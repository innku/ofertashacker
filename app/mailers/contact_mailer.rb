class ContactMailer < ActionMailer::Base
  def contact(job, user)
    @user = user
    mail(:to=>"chinog9@gmail.com",:from=>job.company.email, :subject=>"[#{user.email}] Prueba" )
  end
end
