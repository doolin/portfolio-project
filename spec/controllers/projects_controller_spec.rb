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

  describe '#index' do
    it 'assigns all projects as @projects' do
      allow(Project).to receive(:all) { [mock_project] }
      get :index
      expect(assigns(:projects)).to eq([mock_project])
    end
  end

  describe '#show' do
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

  describe '#edit' do
    it 'assigns the requested project as @project' do
      allow(Project).to receive(:find).with('37') { mock_project }
      get :edit, params: { id: '37' }
      expect(assigns(:project)).to be(@mock_project)
    end
  end

  describe '#create' do
    describe 'with valid params' do
      let(:params) { { project: attributes_for(:project) } }

      it 'assigns a newly created project as @project' do
        allow(Project).to receive(:new).with('these' => 'params') { mock_project(save: true) }
        post :create, params: { project: { 'these' => 'params' } }
        expect(assigns(:project)).to be(@mock_project)
      end

      it 'creates a new project for signed in member' do
        @member = FactoryGirl.create(:member)
        sign_in @member
        expect do
          post :create, params: params
        end.to change(Project, :count).by(1)
      end

      it 'redirects to the created project' do
        member = FactoryGirl.create(:member)
        FactoryGirl.create :profile, member: member
        sign_in member
        post :create, params: params
        project = Project.find_by(name: 'Project test')
        expect(response).to redirect_to(project_url(project))
      end

      it 'redirects to the sign in page when not logged in' do
        allow(Project).to receive(:new) { mock_project(save: true) }
        post :create, params: {}
        expect(response).to redirect_to(new_member_session_path)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved project as @project' do
        allow(Project).to receive(:new).with('these' => 'params') { mock_project(save: false) }
        post :create, params: { project: { 'these' => 'params' } }
        expect(assigns(:project)).to be(@mock_project)
      end

      it "re-renders the 'new' template" do
        member = FactoryGirl.create(:member)
        sign_in member
        post :create, params: { project: {
          name: 'Project test',
          summary: 'Test example',
          foo: 'bar'
        } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#update' do
    before(:each) do
      @member = create :member
      sign_in @member
    end

    context 'with valid params' do
      let(:new_name) { 'Updated test' }
      let(:project) { create :project, member: @member }
      subject(:updated) { patch :update, params: { id: project.url, project: { name: new_name } } }

      it 'updates the requested project' do
        patch :update, params: { id: project.url, project: { name: new_name } }
        project.reload
        expect(project.name).to eq new_name
      end

      it 'assigns the requested project as @project' do
        patch :update, params: { id: project.url, project: { name: new_name } }
        expect(assigns(:project).name).to eq new_name
      end

      it 'redirects to the project' do
        expect(updated).to redirect_to(project_url(assigns(:project)))
      end
    end

    context 'with invalid params' do
      it 'assigns the project as @project' do
        allow(Project).to receive(:find_by_url) { mock_project(update_attributes: false) }
        patch :update, params: { id: '1', project: attributes_for(:project) }
        expect(assigns(:project)).to be(@mock_project)
      end

      it "re-renders the 'edit' template" do
        allow(Project).to receive(:find_by_url) { mock_project(update_attributes: false) }
        patch :update, params: { id: '1', project: attributes_for(:project) }
        expect(response).to render_template(:edit)
      end
    end

    context 'when not an authenticated member' do
      it 'redirects to the sign in page' do
        sign_out @member
        allow(Project).to receive(:find_by_url) { mock_project(update_attributes: true) }
        patch :update, params: { id: '1' }
        expect(response).to redirect_to(new_member_session_path)
      end
    end
  end

  describe '#destroy' do
    let(:member) { create :member }
    subject { delete :destroy, params: { id: 'some-project' } }

    before(:each) do
      sign_in member
      allow(Project).to receive(:find_by_url).with('some-project') { mock_project }
    end

    it 'destroys the requested project by url' do
      expect(mock_project).to receive(:destroy)
      delete :destroy, params: { id: 'some-project' }
    end

    it 'redirects to the projects list' do
      expect(subject).to redirect_to(projects_url)
    end

    it 'redirects to sign_in when not logged in' do
      sign_out member
      expect(subject).to redirect_to(new_member_session_path)
    end
  end
end
