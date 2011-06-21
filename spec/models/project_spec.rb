require 'spec_helper'

describe Project do

  before(:each) do
    @member = Factory(:member)
    @attr = {
      :name => "Foo project",
      :summary => "We did it again.",
      :client => "Dave D",
      :description => "A short description for testing.",
      :startdate => DateTime.new,
      :finishdate => DateTime.new
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
      #@project.member_id.should == @member.id
      @project.member.should == @member
    end    
  end


# I don't like how these validations are structured. They 
# can't be used for outside-in testing; it's possible to 
# write one such that both conditions pass even when the 
# validation isn't specified in the model. Keep an eye out
# for a better way to test validations.
  describe "validations" do
    
    it "should require a member id" do
      Project.new(@attr).should_not be_valid
    end
    
    it "should require nonblank Summary" do
      @member.projects.build(:summary =>" ").should_not be_valid
    end
    
    it "should reject long Summary" do
      @member.projects.build(:summary => "a" * 256).should_not be_valid
    end

    it "should require nonblank Name" do
      @member.projects.build(:name =>" ").should_not be_valid
    end

    it "should reject long Name" do
      @member.projects.build(:name => "a" * 141).should_not be_valid
    end

    it "should require nonblank Description" do
      @member.projects.build(:description =>" ").should_not be_valid
    end

    it "should reject long Description" do
      @member.projects.build(:description => "a" * 2501).should_not be_valid
    end

    it "should require nonblank Start date" do
      @member.projects.build(:startdate =>" ").should_not be_valid
    end

    it "should require nonblank Finish date" do
      @member.projects.build(:finishdate =>" ").should_not be_valid
    end

    it "should reject long Client" do
      @member.projects.build(:client => "a" * 141).should_not be_valid
    end
    
  end

=begin

From the RSpec-users list Shlomi Zadok

Do this instead:

group :development, :test do
  gem 'rspec-rails', '2.5.0'
end

group :test do
  gem 'webrat', '0.7.1'
end

rspec-rails needs to be in the development env in order to expose the rake tasks and the test environment in order to be loaded when you run the spec suite. It has a dependency on rspec, so you don't need to list rspec explicitly.

Webrat only needs to be in the development env.

HTH,
David
=end 
  
end
