# frozen_string_literal: true
class RemoveUrlAnchorToProfile < ActiveRecord::Migration[5.1]
  def up
    remove_column :profiles, :url_anchor
  end

  def down
    add_column :profiles, :url_anchor, :string
  end
end
