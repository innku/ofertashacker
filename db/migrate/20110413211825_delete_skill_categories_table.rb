class DeleteSkillCategoriesTable < ActiveRecord::Migration
  def self.up
    drop_table :skill_categories
  end

  def self.down
    create_table :skill_categories do |t|
      t.string :category
      t.timestamps
    end
  end
end
