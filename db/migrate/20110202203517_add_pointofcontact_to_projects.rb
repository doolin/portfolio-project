# frozen_string_literal: true
class AddPointofcontactToProjects < ActiveRecord::Migration[5.1]
  def self.up
    add_column :projects, :pointofcontact, :string
  end

  def self.down
    remove_column :projects, :pointofcontact
  end
end
