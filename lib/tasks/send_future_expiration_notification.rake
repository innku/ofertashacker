desc 'Sends future job expiration notification to its company'
task send_future_expiration_notification: :environment do
  Job.find_each do |job|
    JobMailer.notificate_future_expiration(job).deliver
  end
end