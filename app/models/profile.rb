class Profile < ActiveRecord::Base
    
  attr_accessible :website
  
  belongs_to :member
  
#  def firstname(id)
#    member = Member.find(id)
#    member.firstname
#  end

  
end
