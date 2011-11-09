class AddUrlAnchorToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :url_anchor, :string
  end
end
