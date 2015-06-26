require 'spec_helper'

describe ProjectsController do
  before :each do
    def mock_project(stubs = {})
      @member = double(Member)
      (@mock_project ||= double(Project).as_null_object).tap do |project|
        project.stub(stubs) unless stubs.empty?
      end
    end
  end

  describe 'GET index' do
    it 'assigns all projects as @projects' do
      Project.stub(:all) { [mock_project] }
      get :index
      expect(assigns(:projects)).to eq([mock_project])
    end
  end

  describe 'GET show' do
    xit 'assigns the requested project as @project' do
      Project.stub(:find).with('37') { mock_project }
      get :show, :id => '37'
      expect(assigns(:project)).to eq(@mock_project)
    end
  end

  describe 'GET new' do
    it 'assigns a new project as @project' do
      Project.stub(:new) { mock_project }
      get :new
      expect(assigns(:project)).to eq(@mock_project)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested project as @project' do
      Project.stub(:find).with('37') { mock_project }
      get :edit, :id => '37'
      expect(assigns(:project)).to be(@mock_project)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'assigns a newly created project as @project' do
        Project.stub(:new).with('these' => 'params') { mock_project(:save => true) }
        post :create, :project => { 'these' => 'params' }
        expect(assigns(:project)).to be(@mock_project)
      end

      xit 'should create a new project for signed in member' do
        @member = FactoryGirl.create(:member)
        sign_in @member
        expect do
          post :create, :project => {
            :name => 'Project test',
            :summary        => 'Test example',
            :description    => 'Some short, descriptive text for testing.',
            :requiredskills => 'Cat herding',
            :client         => 'RSpec',
            :tags           => 'TDD, BDD',
            :startdate      =>  DateTime.new,
            :finishdate     =>  DateTime.new,
            :url            => 'project-test'
          }
        end.to change(Project, :count).by(1)
      end

      xit 'redirects to the created project' do
        member = FactoryGirl.create(:member)
        sign_in member
        #member.build_profile(stub(Profile))
        #pending "Need to add a Devise sign in for this..."
        Project.stub(:new) { mock_project(:save => true) }
        post :create, :project => {}
        expect(response).to redirect_to(project_url(@mock_project))
      end

      xit 'redirects to the sign in page when not logged in' do
        Project.stub(:new) { mock_project(:save => true) }
        post :create, :project => {}
        expect(response).to redirect_to(new_member_session_path)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved project as @project' do
        Project.stub(:new).with('these' => 'params') { mock_project(:save => false) }
        post :create, :project => { 'these' => 'params' }
        expect(assigns(:project)).to be(@mock_project)
      end

      xit "re-renders the 'new' template" do
        Project.stub(:new) { mock_project(:save => false) }
        post :create, :project => {}
        puts response
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT update' do
    before(:each) do
      @member = FactoryGirl.create(:member)
      sign_in @member
    end

    describe 'with valid params' do
#       xit "updates the requested project" do
#         Project.stub(:find_by_url).with("url") { mock_project }
#         mock_project.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, :id => "url", :project => {'these' => 'params'}
#       end

      xit 'assigns the requested project as @project' do
        #Project.stub(:find).with("37") { mock_project }
        Project.stub(:find_by_url).with('new-project') { mock_project(:update_attributes => true) }
        put :update, :id => 'new-project'
        expect(assigns(:project)).to be(@mock_project)
      end

      xit 'redirects to the project' do
        #pending "Need Devise log in..."
        Project.stub(:find_by_url) { mock_project(:update_attributes => true) }
        put :update, :id => '1'
        expect(response).to redirect_to(project_url(mock_project))
      end
    end

    # Some false positives here: Invalid params should mean that the
    # Project parameters are invalid, not that the member is signed out.
    # TODO: Fix these to work correctly instead of simply passing.
    describe 'with invalid params' do
      before(:each) do
        sign_out @member
      end

      it 'assigns the project as @project' do
        Project.stub(:find_by_url) { mock_project(:update_attributes => false) }
        put :update, :id => '1'
        expect(assigns(:project)).to be(@mock_project)
      end

      xit "re-renders the 'edit' template" do
        Project.stub(:find) { mock_project(:update_attributes => false) }
        put :update, :id => '1'
        expect(response).to render_template(:action => 'edit')
      end
    end

    describe 'when not an authenticated member' do
       it 'should redirect to the sign in page' do
         sign_out @member
         Project.stub(:find) { mock_project(:update_attributes => true) }
         put :update, :id => '1'
         expect(response).to redirect_to(new_member_session_path)
       end
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @member = FactoryGirl.create(:member)
      sign_in @member
    end

#     # Uncomment this to see how using the wrong method (:find)
#     # creates an error in the test.
#     xit "destroys the requested project" do
#       Project.should_receive(:find).with("37") { mock_project }
#       mock_project.should_receive(:destroy)
#       delete :destroy, :id => "37"
#     end

    xit 'destroys the requested project by url' do
      Project.should_receive(:find_by_url).with('new-project') { mock_project }
      mock_project.should_receive(:destroy)
      delete :destroy, :id => 'new-project'
    end

    it 'redirects to the projects list' do
      Project.stub(:find_by_url) { mock_project }
      delete :destroy, :id => 'new-project'
      expect(response).to redirect_to(projects_url)
    end
  end
end
