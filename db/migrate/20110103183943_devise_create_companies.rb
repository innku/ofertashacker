class DeviseCreateCompanies < ActiveRecord::Migration
  def self.up
    create_table(:companies) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      t.string  :title
      t.string  :city
      t.text    :description
      t.timestamps
    end
    add_index :companies, :title,                :unique => true
    add_index :companies, :city,                :unique => false
    add_index :companies, :email,                :unique => true
    add_index :companies, :reset_password_token, :unique => true
    add_index :companies, :confirmation_token,   :unique => true
    # add_index :companies, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :companies
  end
end
