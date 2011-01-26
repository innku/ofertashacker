class AddCityToCompanies < ActiveRecord::Migration
  def self.up 
    change_table :companies do |t|
        t.integer :city_id
    end
      add_index :companies, :city_id
  end
  
  def self.down
    change_table :companies do |t|
        t.remove :city_id
    end
  end
  
end