# frozen_string_literal: true
class AddPointofcontactToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :pointofcontact, :string
  end

  def self.down
    remove_column :projects, :pointofcontact
  end
end
