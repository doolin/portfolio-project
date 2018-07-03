# frozen_string_literal: true

class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :remember_me,
  #                 :firstname, :lastname, :membername, :profile_attributes,
  #                 :recoverable #, password_confirmation

  has_many :projects, dependent: :destroy
  has_one :profile, dependent: :destroy

  # TODO: the f.fields_for form code got removed
  # while trying to figure out a redirect for
  # after sign in. Check out this commit:
  # https://github.com/doolin/portfolio-project/blob/c2bfd16f13eb48699267a326411a795e419fe136/app/views/registrations/new.html.erb
  accepts_nested_attributes_for :profile
  # has_many :websites, :through => :profile

  # Move these to Profiles
  validates :firstname, presence: true
  validates :lastname, presence: true
  # validates :membername, :presence => true
  # validates :email, :presence => true, :uniqueness => true
  # validates :email, :presence => true
  validates :email, uniqueness: true
  # validates_uniqueness_of :email
end
