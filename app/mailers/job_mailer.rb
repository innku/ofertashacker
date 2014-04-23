#encoding: utf-8;
class JobMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)

  def notificate_future_expiration(job)
    to = job.company.email
    @job = job
    @company = job.company
    mail(:to => to, :from => "OfertasHacker@ofertashacker.com", :subject => "#{I18n.t('mailers.job.future_expiration_subject')} #{@job.title}")
  end

  def notificate_expiration(job)
	to = job.company.email
    @job = job
    @company = job.company
    mail(:to => to, :from => "OfertasHacker@ofertashacker.com", :subject => "#{I18n.t('mailers.job.expiration_subject')} #{@job.title}")
  end

end