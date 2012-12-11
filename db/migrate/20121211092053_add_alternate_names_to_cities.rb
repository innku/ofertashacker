class AddAlternateNamesToCities < ActiveRecord::Migration
  def change
    add_column :cities, :alternate_names, :string
    add_index :cities, :alternate_names
  end
end
