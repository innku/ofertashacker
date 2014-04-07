#encoding: utf-8;
class OfferMailer < ActionMailer::Base

  def notificate_expiration(job)
    to = job.company.email
    @job = job
    @company = job.company
    mail(:to => to, :from => "OfertasHacker@ofertashacker.com", :subject => "#{I18n.t('mailers.job.expiration_subject')} #{@job.title}")
  end

end