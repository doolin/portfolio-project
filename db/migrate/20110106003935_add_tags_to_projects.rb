# frozen_string_literal: true
class AddTagsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :tags, :string
  end

  def self.down
    remove_column :projects, :tags
  end
end
