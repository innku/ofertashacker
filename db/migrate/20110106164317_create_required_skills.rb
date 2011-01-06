class CreateRequiredSkills < ActiveRecord::Migration
  def self.up
    create_table :required_skills do |t|
      t.string :skill_name
      t.integer :job_id

      t.timestamps
    end
  end

  def self.down
    drop_table :required_skills
  end
end
