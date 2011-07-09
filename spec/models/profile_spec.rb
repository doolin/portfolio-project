require 'spec_helper'

describe Profile do
  
  before(:each) do
    @member = Factory(:member)
    @attr = {
      :firstname => "Joe",
      :lastname  => "Bloggs",
      :created_at => 1.day.ago
    }
  end


# Play around with these calls; some work, some don't.
  it "should create a new profile given valid attributes" do
    #@member.should be_valid
    # This doesn't work. Why not?
    #@member.profile.create!(@attr)
    #@member.profile.create!(:firstname => 'Joe', :lastname => 'Bloggs')
    @p1 = Factory(:profile, :member => @member, :created_at => 1.day.ago)
    @p1.should be_valid
    @member.profile.should be_valid
  end



  describe "Validations" do

    it "should require a member id" do
      Profile.new(@attr).should_not be_valid
    end

    it "should require nonblank firstname" do
      @member.build_profile(:firstname =>" ").should_not be_valid
    end

    it "should require nonblank lsstname" do
      @member.build_profile(:lsstname =>" ").should_not be_valid
    end

  end

end
