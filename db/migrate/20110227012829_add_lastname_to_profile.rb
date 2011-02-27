class AddLastnameToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :lastname, :string
  end

  def self.down
    remove_column :profiles, :lastname
  end
end
