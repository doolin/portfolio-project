require 'spec_helper'

describe Profile do
  before(:each) do
    @member = FactoryGirl.create(:member)
    @attr = {
      :firstname => 'Joe',
      :lastname  => 'Bloggs',
      :created_at => 1.day.ago
    }
  end

  # Play around with these calls; some work, some don't.
  it 'should create a new profile given valid attributes' do
    #@member.should be_valid
    # This doesn't work. Why not?
    #@member.profile.create!(@attr)
    #@member.profile.create!(:firstname => 'Joe', :lastname => 'Bloggs')
    @p1 = FactoryGirl.create(:profile, :member => @member, :created_at => 1.day.ago)
    expect(@p1).to be_valid
    expect(@member.profile).to be_valid
  end

  describe 'Validations' do
    it 'should require a member id' do
      expect(Profile.new(@attr)).not_to be_valid
    end

    it 'should require nonblank firstname' do
      expect(@member.build_profile(@attr.merge({:firstname => ' '}))).not_to be_valid
    end

    it 'should require nonblank lastname' do
      expect(@member.build_profile(@attr.merge({:lastname => ' '}))).not_to be_valid
    end

    # http://intridea.com/2009/2/18/quick-tip-url-validation-in-rails?blog=company
    it 'should validate any given urls' do
      expect(@member.build_profile(@attr.merge({:website => 'http://foobar.com/'}))).to be_valid
    end

    it 'should validate any given urls without http' do
      expect(@member.build_profile(@attr.merge({:website => 'foobar.com/'}))).to be_valid
    end

    xit 'should not validate url with bogus protocol' do
      expect(@member.build_profile(@attr.merge({:website => 'httt://foobar.com/'}))).not_to be_valid
    end

    xit 'should not validate url with bogus domain' do
      expect(@member.build_profile(@attr.merge({:website => 'http://foobar/'}))).not_to be_valid
    end
  end
end
