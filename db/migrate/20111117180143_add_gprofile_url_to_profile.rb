class AddGprofileUrlToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :gprofile_url, :string
  end
end