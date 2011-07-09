class Profile < ActiveRecord::Base
    
  attr_accessible :website, :firstname, :lastname, :twitter, :bio, :url,
                  :facebook, :linkedin 
  
  belongs_to :member

  validates :member_id, :presence => true
  #validates :firstname, :presence => true
  #validates :lastname,  :presence => true
  
  acts_as_url :lastname, :sync_url => :true
  
  def to_param
    url
  end

end

# http://railsforum.com/viewtopic.php?id=42819