class Profile < ActiveRecord::Base
    
  attr_accessible :website, :firstname, :lastname, :twitter, :bio 
  
  belongs_to :member #, :foreign_key => 'member_id'
  
# http://railsforum.com/viewtopic.php?id=42819

  
end
