class AddExtraSkillsToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :extra_skill, :text
  end

  def self.down
    remove_column :jobs, :extra_skill
  end
end
