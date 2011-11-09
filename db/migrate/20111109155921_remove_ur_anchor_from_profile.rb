class RemoveUrAnchorFromProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :ur_anchor
  end

  def down
    add_column :profiles, :ur_anchor, :string
  end
end
