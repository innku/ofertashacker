class AddPersonalLinksToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :github_url, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :personal_url, :string
  end

  def self.down
    remove_column :users, :personal_url
    remove_column :users, :linkedin_url
    remove_column :users, :github_url
  end
end
