# frozen_string_literal: true
class AddFirstnameToMembers < ActiveRecord::Migration[5.1]
  def self.up
    add_column :members, :firstname, :string
  end

  def self.down
    remove_column :members, :firstname
  end
end
