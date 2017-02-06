# frozen_string_literal: true
class AddMemberIdToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :member_id, :integer
    add_index :projects, :member_id
  end

  def self.down
    remove_column :projects, :member_id
  end
end
