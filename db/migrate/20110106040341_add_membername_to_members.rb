# frozen_string_literal: true
class AddMembernameToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :membername, :string
  end

  def self.down
    remove_column :members, :membername
  end
end
