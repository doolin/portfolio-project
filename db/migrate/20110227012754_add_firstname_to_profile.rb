# frozen_string_literal: true
class AddFirstnameToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :firstname, :string
  end

  def self.down
    remove_column :profiles, :firstname
  end
end
