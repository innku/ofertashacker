class JobRequiredSkills < ActiveRecord::Migration
  def self.up
    create_table :jobs_required_skills, :id => false do |t|
      t.integer :job_id
      t.integer :required_skill_id
    end
    
    add_index :jobs_required_skills, [:job_id, :required_skill_id]
  end

  def self.down
    drop_table :jobs_required_skills
  end
end
