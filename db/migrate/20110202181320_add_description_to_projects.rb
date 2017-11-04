# frozen_string_literal: true
class AddDescriptionToProjects < ActiveRecord::Migration[5.1]
  def self.up
    add_column :projects, :description, :text
  end

  def self.down
    remove_column :projects, :description
  end
end
