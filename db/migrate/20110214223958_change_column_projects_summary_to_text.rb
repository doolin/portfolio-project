class ChangeColumnProjectsSummaryToText < ActiveRecord::Migration
  def self.up
    change_column :projects, :summary, :text
  end

  def self.down
  end
end
