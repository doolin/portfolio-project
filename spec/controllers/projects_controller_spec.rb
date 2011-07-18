require 'spec_helper'

describe ProjectsController do

  def mock_project(stubs={})
    @member = mock(Member)
    (@mock_project ||= mock_model(Project).as_null_object).tap do |project|
    #(@mock_project ||= mock_model(Project).as_new_record.as_null_object).tap do |project|
      project.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all projects as @projects" do
      Project.stub(:all) { [mock_project] }
      get :index
      assigns(:projects).should eq([mock_project])
    end
  end

  describe "GET show" do
    it "assigns the requested project as @project" do
      Project.stub(:find).with("37") { mock_project }
      get :show, :id => "37"
      assigns(:project).should eq(@mock_project)
    end
  end

  describe "GET new" do
    it "assigns a new project as @project" do
      Project.stub(:new) { mock_project }
      get :new
      assigns(:project).should eq(@mock_project)
    end
  end

  describe "GET edit" do
    it "assigns the requested project as @project" do
      Project.stub(:find).with("37") { mock_project }
      get :edit, :id => "37"
      assigns(:project).should be(@mock_project)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created project as @project" do
        Project.stub(:new).with({'these' => 'params'}) { mock_project(:save => true) }
        post :create, :project => {'these' => 'params'}
        assigns(:project).should be(@mock_project)
      end




      it "redirects to the created project" do
        
        member = Factory(:member)
        sign_in member
        #member.build_profile(stub(Profile))
        #pending "Need to add a Devise sign in for this..."
        Project.stub(:new) { mock_project(:save => true) }
        post :create, :project => {}
        response.should redirect_to(project_url(@mock_project))
      end

      it "redirects to the sign in page when not logged in" do
        Project.stub(:new) { mock_project(:save => true) }
        post :create, :project => {}
        response.should redirect_to(new_member_session_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        Project.stub(:new).with({'these' => 'params'}) { mock_project(:save => false) }
        post :create, :project => {'these' => 'params'}
        assigns(:project).should be(@mock_project)
      end

      it "re-renders the 'new' template" do
        Project.stub(:new) { mock_project(:save => false) }
        post :create, :project => {}
        response.should render_template(:action => "new")
      end
    end

  end


  describe "PUT update" do

    before(:each) do 
      @member = Factory(:member)
      sign_in @member
    end

    describe "with valid params" do

      xit "updates the requested project" do
        #Project.should_receive(:find).with("37") { mock_project }
        Project.stub(:find).with("37") { mock_project }
        mock_project.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :project => {'these' => 'params'}
      end

      xit "assigns the requested project as @project" do
        #Project.stub(:find).with("37") { mock_project }
        Project.stub(:find).with("1") { mock_project(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:project).should be(@mock_project)
      end

      xit "redirects to the project" do
        #pending "Need Devise log in..."
        Project.stub(:find) { mock_project(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(project_url(mock_project))
      end
    end

    describe "with invalid params" do
      xit "assigns the project as @project" do
        Project.stub(:find) { mock_project(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:project).should be(mock_project)
      end

      xit "re-renders the 'edit' template" do
        Project.stub(:find) { mock_project(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end


    describe "when not an authenticated member" do
       it "should redirect to the sign in page" do
         sign_out @member
         Project.stub(:find) { mock_project(:update_attributes => true) }
         put :update, :id => "1"
         response.should redirect_to(new_member_session_path)
       end
    end

  end

#=begin
  describe "DELETE destroy" do

    before(:each) do 
      @member = Factory(:member)
      sign_in @member
    end


    xit "destroys the requested project" do
      Project.should_receive(:find).with("37") { mock_project }
      mock_project.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    xit "redirects to the projects list" do
      Project.stub(:find) { mock_project }
      delete :destroy, :id => "1"
      response.should redirect_to(projects_url)
    end
  end
#=end

end
