class AddUriAnchorToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :uri_anchor, :string
  end
end
