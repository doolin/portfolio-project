class Project < ActiveRecord::Base

  attr_accessible :name, :summary, :client, :tags
  
  belongs_to :member

  validates :summary, :presence => true, :length => { :maximum => 140 }
  validates :member_id, :presence => true
  
  default_scope :order => 'projects.created_at DESC'
  
end
