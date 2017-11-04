# frozen_string_literal: true
class AddFinishdateToProjects < ActiveRecord::Migration[5.1]
  def self.up
    add_column :projects, :finishdate, :datetime
  end

  def self.down
    remove_column :projects, :finishdate
  end
end
