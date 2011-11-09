class RemoveUrlAnchorFromProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :url_anchor
  end

  def down
    add_column :profiles, :url_anchor, :string
  end
end
