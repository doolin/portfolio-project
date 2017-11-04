# frozen_string_literal: true
class AddUrlToProfiles < ActiveRecord::Migration[5.1]
  def self.up
    add_column :profiles, :url, :string
  end

  def self.down
    remove_column :profiles, :url
  end
end
