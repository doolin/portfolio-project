# frozen_string_literal: true
class AddLastnameToProfile < ActiveRecord::Migration[5.1]
  def self.up
    add_column :profiles, :lastname, :string
  end

  def self.down
    remove_column :profiles, :lastname
  end
end
