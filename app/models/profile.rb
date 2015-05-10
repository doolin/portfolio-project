class Profile < ActiveRecord::Base

  # attr_accessible :website, :firstname, :lastname, :twitter, :bio, :url,
  #                 :facebook, :linkedin, :website_anchor, :gprofile_url

  belongs_to :member

  validates :member_id, :presence => true
  validates :firstname, :presence => true
  validates :lastname,  :presence => true

  #validates :website, :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :on => :create, :allow_nil => true, :on => :update }
  #https://github.com/ihower/validates_url_of/blob/master/lib/validates_url_of.rb#L28
  #validates :website, :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :allow_nil => true, :on => :create }
  #validates :website, :format => { :with => /(^$)|(^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :allow_nil => true, :on => :create }

  acts_as_url :lastname, :sync_url => :true

  def to_param
    url
  end

=begin
  def validate_url
    false
  end
=end

end

# http://railsforum.com/viewtopic.php?id=42819
