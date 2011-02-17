require 'spec_helper'


describe Member do

  describe "project associations" do
    
    before(:each) do
      @member = Factory(:member)
      @p1 = Factory(:project, :member => @member, :created_at => 1.day.ago)
      @p2 = Factory(:project, :member => @member, :created_at => 1.hour.ago)
    end
    
    it "should have a projects attribute" do
      @member.should respond_to(:projects)
    end
    
    it "should have the right projects in the right order" do
      @member.projects.should == [@p2, @p1]
    end
    
    it "should destroy associated projects" do
      @member.destroy
      [@p1, @p2].each do |p|
        Project.find_by_id(p.id).should be_nil
      end
    end
  end
    
    
=begin      
  describe "profile associations" do

    before(:each) do
      @member = Factory(:member)
      @p1 = Factory(:profile, :member => @member, :created_at => 1.day.ago)
      @p2 = Factory(:profile, :member => @member, :created_at => 1.hour.ago)
    end

    it "should destroy the associated profile" do
      @member.destroy
      [@p1, @p2].each do |p|
        Profile.find_by_id(p.id).should be_nil
      end
    end

  end 
=end    
    
    
  describe "saving" do
  	
  	it 'requires first and last name' do
      Factory(:member).should be_valid
      Factory.build(:member, :firstname => nil).should_not be_valid
      Factory.build(:member, :lastname => nil).should_not be_valid
    end
    
    it "should enforce unique email" do
    	m1 = Factory(:member)
    	m2 = Factory.build(:member, :email => m1.email).should_not be_valid
    end
    	
  end  
    
end
