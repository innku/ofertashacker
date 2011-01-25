class CreateMetropoliStates < ActiveRecord::Migration
  def self.up
    
    create_table :states do |t|
      t.integer :country_id
      t.string  :name
      t.string  :abbr
    end
    
    add_index :states, :country_id
    add_index :states, :name
    add_index :states, :abbr
    
  end
  
  def self.down
    drop_table :states
  end
  
end