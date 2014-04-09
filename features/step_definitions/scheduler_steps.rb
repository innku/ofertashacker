Given /^that there is a job that expires today$/ do
	job = FactoryGirl.create(:job)
	job.update_attribute(:expiration_date, DateTime.now.beginning_of_day)
end

Given /^the schedule task runs$/ do
  Job.expire_today.each do |job|
    OfferMailer.notificate_expiration(job).deliver
  end
end

Then /^the job owner should receive an email saying the job is expired\.$/ do
  expired_job = Job.expire_today.first
  open_email(expired_job.company.email)
  current_email.subject.should eq "#{I18n.t('mailers.job.expiration_subject')} #{expired_job.title}"
end
