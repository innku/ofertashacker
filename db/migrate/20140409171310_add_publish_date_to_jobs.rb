class AddPublishDateToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :publish_date, :datetime, :default => DateTime.now
  end
end
