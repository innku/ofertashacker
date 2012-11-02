class RenameCityOnJobs < ActiveRecord::Migration
  def up
    rename_column :jobs, :city, :city2
  end

  def down
    rename_column :jobs, :city2, :city
  end
end
