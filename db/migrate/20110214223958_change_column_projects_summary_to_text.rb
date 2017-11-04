# frozen_string_literal: true
class ChangeColumnProjectsSummaryToText < ActiveRecord::Migration[5.1]
  def self.up
    change_column :projects, :summary, :text
  end

  def self.down; end
end
