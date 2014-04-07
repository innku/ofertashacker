class UpdateExpirationDateOnJobs < ActiveRecord::Migration
  def change
    Job.update_all(:expiration_date => 60.days.from_now.beginning_of_day)
  end
end
