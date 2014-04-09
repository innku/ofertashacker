class CopyCreatedAtToPublishDateOnJobs < ActiveRecord::Migration
  def change
  	Job.find_each do |job|
    	job.update_attribute(:publish_date, job.created_at)
 	end
  end
end
