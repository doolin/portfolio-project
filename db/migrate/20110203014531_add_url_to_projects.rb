# frozen_string_literal: true
class AddUrlToProjects < ActiveRecord::Migration[5.1]
  def self.up
    add_column :projects, :url, :string
  end

  def self.down
    remove_column :projects, :url
  end
end
