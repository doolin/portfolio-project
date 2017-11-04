# frozen_string_literal: true
class AddLastnameToMembers < ActiveRecord::Migration[5.1]
  def self.up
    add_column :members, :lastname, :string
  end

  def self.down
    remove_column :members, :lastname
  end
end
