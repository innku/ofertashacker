class AddSkillCategoryIdToRequiredSkill < ActiveRecord::Migration
  def self.up
    add_column :required_skills, :skill_category_id, :integer
  end

  def self.down
    remove_column :required_skills, :skill_category_id
  end
end
