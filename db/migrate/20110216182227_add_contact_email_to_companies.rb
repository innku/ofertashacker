class AddContactEmailToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :contact_email, :string
  end

  def self.down
    remove_column :companies, :contact_email
  end
end
