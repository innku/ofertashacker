class RemoveConfirmableFromCompanies < ActiveRecord::Migration
  def self.up
    remove_column :companies, :confirmed_at
    remove_column :companies, :confirmation_token
    remove_column :companies, :confirmation_sent_at
    remove_index :companies, :confirmation_token
  end

  def self.down
    add_column :companies, :confirmed_at, :datetime
    add_column :companies, :confirmation_sent_at, :datetime
    add_column :companies, :confirmation_token, :string
    add_index :companies, :confirmation_token,   :unique => true
  end
end
