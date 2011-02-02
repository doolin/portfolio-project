class AddFinishdateToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :finishdate, :datetime
  end

  def self.down
    remove_column :projects, :finishdate
  end
end
