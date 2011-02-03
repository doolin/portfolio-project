class Project < ActiveRecord::Base

  attr_accessible :name, :summary, :client, :tags, :description, :pointofcontact,
                  :startdate, :finishdate, :url
  
  belongs_to :member

  validates :summary, :presence => true, :length => { :maximum => 140 }
  validates :member_id, :presence => true
  
  default_scope :order => 'projects.created_at DESC'
  
  acts_as_url :name, :sync_url => :true
  
  def membername(id)
    member = Member.find(id)
    member.firstname + " " + member.lastname
  end
 
  def to_param
    url
  end

end
