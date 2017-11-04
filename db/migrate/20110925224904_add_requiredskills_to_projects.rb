# frozen_string_literal: true
class AddRequiredskillsToProjects < ActiveRecord::Migration[5.1]
  def self.up
    add_column :projects, :requiredskills, :string
  end

  def self.down
    remove_column :projects, :requiredskills
  end
end
