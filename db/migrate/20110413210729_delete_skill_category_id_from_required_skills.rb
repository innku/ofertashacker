class DeleteSkillCategoryIdFromRequiredSkills < ActiveRecord::Migration
  def self.up
    remove_column :required_skills, :skill_category_id
  end

  def self.down
    add_column :required_skills, :skill_category_id, :integer
  end
end
