# frozen_string_literal: true
class AddUrlAnchorToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :url_anchor, :string
  end
end
