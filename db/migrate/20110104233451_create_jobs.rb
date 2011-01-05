class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :company_id
      t.string :title
      t.string :state
      t.boolean :full_time, :default => false
      t.boolean :part_time, :default => false
      t.boolean :remote, :default => false
      t.boolean :flexible, :default => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
