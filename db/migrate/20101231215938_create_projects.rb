# frozen_string_literal: true
class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :summary
      t.string :client

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
