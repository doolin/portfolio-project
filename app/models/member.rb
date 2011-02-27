class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :firstname, :lastname, :membername, :profile_attributes

  has_many :projects, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  accepts_nested_attributes_for :profile
  #has_many :websites, :through => :profile  

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates_uniqueness_of :email
  
  
end

