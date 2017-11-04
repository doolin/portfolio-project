# frozen_string_literal: true
class AddUriAnchorToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :uri_anchor, :string
  end
end
