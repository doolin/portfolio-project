
require 'spec_helper'

describe MembersController do
  
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @member = Factory(:member)
    end
    
    it "should show the member's projects'" do
      p1 = Factory(:project, :member => @member, :summary => "Foo bar")
      p2 = Factory(:project, :member => @member, :summary => "Baz quux")
      #get :show, :id => @member
      get :show, :id => @member
      #response.should have_selector("span.content", :summary => mp1.content)
      #response.should have_selector("span.content", :summary => mp2.content)
    end
    
    
    
  end
end