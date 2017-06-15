# frozen_string_literal: true

class Profile < ActiveRecord::Base
  # attr_accessible :website, :firstname, :lastname, :twitter, :bio, :url,
  #                 :facebook, :linkedin, :website_anchor, :gprofile_url

  belongs_to :member

  validates :member_id, presence: true
  validates :firstname, presence: true
  validates :lastname,  presence: true

  # validates :website, :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :on => :create, :allow_nil => true, :on => :update }
  # https://github.com/ihower/validates_url_of/blob/master/lib/validates_url_of.rb#L28
  # validates :website, :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :allow_nil => true, :on => :create }
  # validates :website, :format => { :with => /(^$)|(^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :allow_nil => true, :on => :create }

  # validate :website_validator
  # validates :website, url: true
  # validate :url_scheme
  # before_validation :smart_add_url_protocol

  def website_validator
    # PublicSuffix.valid?("google.com")
    # ap "website: #{website}"
    PublicSuffix.valid?(website)
  end

  acts_as_url :lastname, sync_url: :true

  def to_param
    url
  end

  def url_scheme
    # ap "url_scheme: #{website}"
    # website = URI.parse(website) # && !website.host.nil?
    # URI.parse(website) #&& !website.host.nil?
    URI.parse(website) && PublicSuffix.valid?(website)
  rescue URI::InvalidURIError
    # ap "url_scheme, invalid: #{website}"
    errors.add(:website, 'is not a valid HTTP URL')
    false
  end

  protected

  def smart_add_url_protocol
    return if website.nil?
    # self.website = "http://#{website}" unless website[/\Ahttp:\/\//] || website[/\Ahttps:\/\//]
    self.website = "http://#{website}" unless website[%r{/\Ahttp:\/\//}] || website[%r{/\Ahttps:\/\//}]
  end

  #   def validate_url
  #     false
  #   end
end

# http://railsforum.com/viewtopic.php?id=42819
