class Profile < ActiveRecord::Base
  
  attr_accessible :website_url
  
  belongs_to :member
  
  
end
