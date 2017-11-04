# frozen_string_literal: true
class AddUriToProject < ActiveRecord::Migration[5.1]
  def self.up
    add_column :projects, :uri, :string
  end

  def self.down
    remove_column :projects, :uri
  end
end
