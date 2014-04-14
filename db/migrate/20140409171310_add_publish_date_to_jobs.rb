class AddPublishDateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :publish_date, :datetime
  end
end
