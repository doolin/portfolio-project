require 'spec_helper'

describe MembersController do
  
  # Including this produces an error, probably
  # conflicts before(:each) below, or something
  # like that.
  #login_admin 
  
  #render_views

  before(:each) do
    @member = FactoryGirl.create :member
  end
  
  describe "GET 'show'" do
    it "should show the member's projects'" do
      # TODO: these should move to view specs
      p1 = FactoryGirl.create(:project, :member => @member, :summary => "Foo bar")
      p2 = FactoryGirl.create(:project, :member => @member, :summary => "Baz quux")
      @member.projects = [p1, p2]
      get :show, :id => @member
      response.should render_template("show")
    end
  end

  describe "GET 'index'" do
    
    it "signed in should list member profiles" do
      sign_in @member
      get :index
      response.should redirect_to(profiles_path)
    end

    it "signed out should redirect to sign in path" do
      sign_out @member
      get :index
      response.should redirect_to(new_member_session_path)
    end
    
  end
  
  
    describe "PUT update" do
      # Devise handles this stuff
    end

end
