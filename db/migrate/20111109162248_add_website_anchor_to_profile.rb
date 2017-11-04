# frozen_string_literal: true
class AddWebsiteAnchorToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :website_anchor, :string
  end
end
