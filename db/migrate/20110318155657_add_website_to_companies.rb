class AddWebsiteToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :website, :string
  end

  def self.down
    remove_column :companies, :website
  end
end
