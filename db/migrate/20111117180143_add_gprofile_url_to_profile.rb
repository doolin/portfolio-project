# frozen_string_literal: true
class AddGprofileUrlToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :gprofile_url, :string
  end
end
