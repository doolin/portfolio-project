require 'spec_helper'

describe Project do

  before(:each) do
    @member = Factory(:member)
    @attr = {
      :name => "Foo project",
      :summary => "We did it again.",
      :client => "Dave D"
    }
  end

  it "should create a new instance given valid attributes" do
    @member.projects.create!(@attr)
  end
  
  describe "member associations" do
    
    before(:each) do
      @project = @member.projects.create(@attr)
    end
    
    it "should have a member attribute" do
      @project.should respond_to(:member)
    end
    
    it "should have the correct associated member" do
      @project.member_id.should == @member.id
      @project.member.should == @member
    end    
  end

  describe "validations" do
    
    it "should require a member id" do
      Project.new(@attr).should_not be_valid
    end
    
    it "should require nonblank summary" do
      @member.projects.build(:summary =>" ").should_not be_valid
    end
    
    it "should reject long summary" do
      @member.projects.build(:summary => "a" * 141).should_not be_valid
    end
    
  end

end
