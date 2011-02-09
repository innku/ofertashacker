class AddContactToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :facebook, :string
    add_column :companies, :twitter, :string
    add_column :companies, :linkedin, :string
    add_column :companies, :phone1, :string
    add_column :companies, :phone2, :string
    add_column :companies, :phone3, :string
  end

  def self.down
    remove_column :companies, :phone3
    remove_column :companies, :phone2
    remove_column :companies, :phone1
    remove_column :companies, :linkedin
    remove_column :companies, :twitter
    remove_column :companies, :facebook
  end
end
