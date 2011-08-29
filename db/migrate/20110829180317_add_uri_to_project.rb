class AddUriToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :uri, :string
  end

  def self.down
    remove_column :projects, :uri
  end
end
