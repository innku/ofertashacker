class RemoveConfirmableFromCompanies < ActiveRecord::Migration
  def self.up
    remove_column :companies, :confirmed_at
    remove_column :companies, :confirmation_token
    remove_column :companies, :confirmation_sent_at
  end

  def self.down
    add_column :companies, :confirmed_at, :datetime
    add_column :companies, :confirmation_sent_at, :datetime
    add_column :companies, :confirmation_token, :string
  end
end
