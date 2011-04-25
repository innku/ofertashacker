class RemoveLinkedinFromCompany < ActiveRecord::Migration
  def self.up
    remove_column :companies, :linkedin
  end

  def self.down
    add_column :companies, :phone3, :string
  end
end

