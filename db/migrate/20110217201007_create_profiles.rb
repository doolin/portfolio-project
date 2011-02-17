class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer  :member_id  
      t.text     :bio, :limit => 500
      t.string   :website
      t.string   :twitter
      t.string   :facebook
      t.string   :linkedin

      t.timestamps
    end
    #:index :member_id
  end

  def self.down
    drop_table :profiles
  end
end
