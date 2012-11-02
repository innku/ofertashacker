class RenameCityOnCompanies < ActiveRecord::Migration
  def up
    rename_column :companies, :city, :city2
  end

  def down
    rename_column :companies, :city2, :city
  end
end
