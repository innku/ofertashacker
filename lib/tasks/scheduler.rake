desc 'Sends job expiration notification to its company'
task send_expiration_notification: :environment do
  Job.expire_today.each do |job|
    JobMailer.notificate_expiration(job).deliver
  end
end 