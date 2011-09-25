class AddRequiredskillsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :requiredskills, :string
  end

  def self.down
    remove_column :projects, :requiredskills
  end
end
