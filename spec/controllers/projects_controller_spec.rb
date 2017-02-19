# frozen_string_literal: true
require 'spec_helper'

describe ProjectsController do
  before :each do
    def mock_project(stubs = {})
      (@mock_project ||= double(Project).as_null_object).tap do |project|
        project.stub(stubs) unless stubs.empty?
      end
    end
    @member = FactoryGirl.create :member
  end

  describe 'GET index' do
    it 'assigns all projects as @projects' do
      allow(Project).to receive(:all) { [mock_project] }
      get :index
      expect(assigns(:projects)).to eq([mock_project])
    end
  end

  describe 'GET show' do
    it 'assigns the requested project as @project' do
      allow(Project).to receive(:find).with('37') { mock_project }
      allow(@mock_project).to receive(:member_id).and_return(@member.id)
      get :show, params: { id: '37' }
      expect(assigns(:project)).to eq(@mock_project)
    end
  end

  describe 'GET new' do
    it 'assigns a new project as @project' do
      allow(Project).to receive(:new) { mock_project }
      get :new
      expect(assigns(:project)).to eq(@mock_project)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested project as @project' do
      Project.stub(:find).with('37') { mock_project }
      get :edit, params: { id: '37' }
      expect(assigns(:project)).to be(@mock_project)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      let(:params) {
        {
          name: 'Project test',
          summary: 'Test example',
          description: 'Some short, descriptive text for testing.',
          requiredskills: 'Cat herding',
          client: 'RSpec',
          tags: 'TDD, BDD',
          startdate: Time.now.utc,
          finishdate: Time.now.utc,
          url: 'project-test'
        }
      }

      it 'assigns a newly created project as @project' do
        Project.stub(:new).with('these' => 'params') { mock_project(save: true) }
        post :create, params: { project: { 'these' => 'params' } }
        expect(assigns(:project)).to be(@mock_project)
      end

      it 'creates a new project for signed in member' do
        @member = FactoryGirl.create(:member)
        sign_in @member
        expect do
          # post :create, project: {
          post :create, params: {
            name: 'Project test',
            summary: 'Test example',
            description: 'Some short, descriptive text for testing.',
            requiredskills: 'Cat herding',
            client: 'RSpec',
            tags: 'TDD, BDD',
            startdate: Time.now.utc,
            finishdate: Time.now.utc,
            url: 'project-test'
          }
        end.to change(Project, :count).by(1)
      end

      it 'redirects to the created project' do
        member = FactoryGirl.create(:member)
        FactoryGirl.create :profile, member: member
        sign_in member
        post :create, params: params # {}
        project = Project.find_by(name: 'Project test')
        expect(response).to redirect_to(project_url(project))
      end

      it 'redirects to the sign in page when not logged in' do
        Project.stub(:new) { mock_project(save: true) }
        post :create, params: {}
        expect(response).to redirect_to(new_member_session_path)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved project as @project' do
        Project.stub(:new).with('these' => 'params') { mock_project(save: false) }
        post :create, params: { project: { 'these' => 'params' } }
        expect(assigns(:project)).to be(@mock_project)
      end

      it "re-renders the 'new' template" do
        member = FactoryGirl.create(:member)
        sign_in member
        post :create, params: {}
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT update' do
    before(:each) do
      @member = create :member
      sign_in @member
    end

    describe 'with valid params' do
      #       xit "updates the requested project" do
      #         Project.stub(:find_by_url).with("url") { mock_project }
      #         mock_project.should_receive(:update_attributes).with({'these' => 'params'})
      #         put :update, :id => "url", :project => {'these' => 'params'}
      #       end

      xit 'assigns the requested project as @project' do
        # Project.stub(:find).with("37") { mock_project }
        # Project.stub(:find_by_url).with('new-project') { mock_project(update_attributes: true) }
        allow(Project).to receive(:find_by_url).with('new-project') { mock_project(update_attributes: true) }
        put :update, params: { id: 'new-project' }
        expect(assigns(:project)).to be(@mock_project)
      end

      xit 'redirects to the project' do
        # Project.stub(:find_by_url) { mock_project(update_attributes: true) }
        allow(Project).to receive(:find_by_url) { mock_project(update_attributes: true) }
        put :update, params: { id: '1' }
        expect(response).to redirect_to(project_url(mock_project))
      end
    end

    # Some false positives here: Invalid params should mean that the
    # Project parameters are invalid, not that the member is signed out.
    # TODO: Fix these to work correctly instead of simply passing.
    describe 'with invalid params' do
      before(:each) do
        # sign_out @member
        sign_in @member
      end

      it 'assigns the project as @project' do
        Project.stub(:find_by_url) { mock_project(update_attributes: false) }
        put :update, params: { id: '1' }
        expect(assigns(:project)).to be(@mock_project)
      end

      it "re-renders the 'edit' template" do
        allow(Project).to receive(:find_by_url) { mock_project(update_attributes: false) }
        put :update, params: { id: '1' }
        expect(response).to render_template(:edit)
      end
    end

    describe 'when not an authenticated member' do
      it 'should redirect to the sign in page' do
        sign_out @member
        Project.stub(:find) { mock_project(update_attributes: true) }
        put :update, params: { id: '1' }
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

    it 'destroys the requested project by url' do
      allow(Project).to receive(:find_by_url).with('new-project') { mock_project }
      allow(mock_project).to receive(:destroy)
      delete :destroy, params: { id: 'new-project' }
    end

    it 'redirects to the projects list' do
      Project.stub(:find_by_url) { mock_project }
      delete :destroy, params: { id: 'new-project' }
      expect(response).to redirect_to(projects_url)
    end
  end
end
