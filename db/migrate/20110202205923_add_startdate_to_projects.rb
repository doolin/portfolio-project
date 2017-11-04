# frozen_string_literal: true
class AddStartdateToProjects < ActiveRecord::Migration[5.1]
  def self.up
    add_column :projects, :startdate, :datetime
  end

  def self.down
    remove_column :projects, :startdate
  end
end
