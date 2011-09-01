require 'spec_helper'

describe ProfilesController do 
  
  before(:each) do
    @member  = Factory(:member)
    @profile = Factory(:profile, :member => @member)
    sign_in @member
  end
  
  describe "GET 'index'" do
    it "lists member profiles when signed in" do
      get :index
      response.should render_template("index")
    end

    it "redirects to sign in path when signed out" do
      sign_out @member
      get :index
      response.should redirect_to(new_member_session_path)
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      sign_out @member
      get :show, :id => @profile.url
      response.should be_success
    end

    it "displays the member's profile" do
      sign_out @member
      get :show, :id => @profile.url
      response.should render_template("show")
    end
  end

  describe "GET 'new'" do
    it "renders the new profile page" do
      get :new
      response.should render_template("new")       
    end
  end

  describe "GET 'edit'" do
    it "renders the edit profile page" do
      get :edit, :id => @profile.url
      response.should render_template("edit")       
    end
  end
  
  describe "POST 'create'" do

    it "should create a new profile for signed in member" do
      lambda do
        post :create, :profile => { :firstname => 'foo', :lastname => 'bar' }#, :website => 'http://foo.com' }
      end.should change(Profile, :count).by(1)
    end

  end

  describe "PUT 'update'" do
    it "should update the profile for signed in member" do
      put :update, :id => @profile.url, :profile => { :firstname => 'Foo', :lastname => 'Bar' }
      @profile.reload
      response.should redirect_to(profile_path(@profile))
      @profile.firstname.should eq('Foo')
      @profile.lastname.should eq('Bar')
    end
  end

  describe "DELETE 'destroy'" do
    
    it "should destroy the profile" do
      lambda do
        delete :destroy, :id => @profile.url
      end.should change(Profile, :count).by(-1)
    end

    it "redirects to the projects list" do
      delete :destroy, :id => @profile.url
      response.should redirect_to(root_path)
    end

=begin
# Leave this in for a bit, the should_receive is a mock_method
    it "destroys the requested profile" do
      #Project.should_receive(:find).with("37") { mock_project }
      @profile.should_receive(:destroy)
      delete :destroy, :id => @profile.url
    end
=end
  end

end