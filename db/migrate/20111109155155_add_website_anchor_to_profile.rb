class AddWebsiteAnchorToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :website_anchor, :string
  end
end
