class AddRoleToCompany < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.string :role, :default => "member"
    end
  end

  def self.down
    change_table :companies do |t|
      t.remove :role
    end
  end
end
