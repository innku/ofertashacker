class AddCityToJobs < ActiveRecord::Migration
  def self.up 
    change_table :jobs do |t|
        t.string  :city
        t.integer :city_id
    end
      add_index :jobs, :city_id
  end
  
  def self.down
    change_table :jobs do |t|
        t.remove :city_id
    end
  end
  
end
