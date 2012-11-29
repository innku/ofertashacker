class AddCountryIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :country_id, :integer
  end
end
