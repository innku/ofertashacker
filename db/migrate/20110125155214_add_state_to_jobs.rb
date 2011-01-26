class AddStateToJobs < ActiveRecord::Migration
  def self.up 
    change_table :jobs do |t|
        t.integer :state_id
    end
      add_index :jobs, :state_id
  end
  
  def self.down
    change_table :jobs do |t|
        t.remove :state_id
    end
  end
  
end