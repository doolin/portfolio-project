class AddStartdateToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :startdate, :datetime
  end

  def self.down
    remove_column :projects, :startdate
  end
end
