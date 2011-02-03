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

end
