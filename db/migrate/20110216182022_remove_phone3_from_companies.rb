class RemovePhone3FromCompanies < ActiveRecord::Migration
  def self.up
    remove_column :companies, :phone3
  end

  def self.down
    add_column :companies, :phone3, :string
  end
end
