class CreateMetropoliCountries < ActiveRecord::Migration
  def self.up
    
    create_table :countries do |t|
      t.string :name
      t.string :abbr
    end
    
    add_index :countries, :name
    add_index :countries, :abbr
    
  end
  
  def self.down
    drop_table :countries
  end
  
end