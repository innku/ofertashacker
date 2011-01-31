class CreateRequiredSkills < ActiveRecord::Migration
  def self.up
    create_table :required_skills do |t|
      t.string :skill_name
      t.timestamps
    end
      add_index :required_skills, :skill_name,:unique => true
  end

  def self.down
    drop_table :required_skills
  end
end
