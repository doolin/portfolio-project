class Project < ActiveRecord::Base

  attr_accessible :name, :summary, :client, :tags, :description, :pointofcontact,
                  :startdate, :finishdate, :url, :member_id
  
  belongs_to :member

  validates :summary,     :presence => true, :length => { :maximum => 255 }
  validates :member_id,   :presence => true
  validates :name,        :presence => true, :length => { :maximum => 140 }
  validates :description, :presence => true, :length => { :maximum => 2500 }

  # The Rails date_select form helper is problematic, being difficult to use
  # for extracting form elements. At the moment, the Rails date_select is
  # providing a default Date (and time) value, which means that the Capybara
  # matcher is working without selecting a date. Not good.
  validates :startdate,   :presence => true
  validates :finishdate,  :presence => true
  validates :client,                         :length => { :maximum => 140 }
  
  
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
