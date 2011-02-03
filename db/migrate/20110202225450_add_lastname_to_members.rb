class AddLastnameToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :lastname, :string
  end

  def self.down
    remove_column :members, :lastname
  end
end
