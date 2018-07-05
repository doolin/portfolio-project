# frozen_string_literal: true

require 'spec_helper'

describe ProjectsController do
  describe 'routing, explicit, long form' do
    it 'recognizes and generates #index' do
      expect(get: '/projects').to route_to(controller: 'projects', action: 'index')
    end

    it 'recognizes and generates #new' do
      expect(get: '/projects/new').to route_to(controller: 'projects', action: 'new')
    end

    it 'recognizes and generates #show' do
      expect(get: '/projects/1').to route_to(controller: 'projects', action: 'show', id: '1')
    end

    it 'recognizes and generates #edit' do
      expect(get: '/projects/1/edit').to route_to(controller: 'projects', action: 'edit', id: '1')
    end

    it 'recognizes and generates #create' do
      expect(post: '/projects').to route_to(controller: 'projects', action: 'create')
    end

    it 'recognizes and generates #update' do
      expect(put: '/projects/1').to route_to(controller: 'projects', action: 'update', id: '1')
    end

    it 'recognizes and generates #destroy' do
      expect(delete: '/projects/1').to route_to(controller: 'projects', action: 'destroy', id: '1')
    end
  end

  describe 'routing short form, url redirect' do
    before(:each) do
      @project = Project.create(name: 'New project')
    end

    it 'routes GET projects_path to the /index action' do
      expect(get(projects_path)).to \
        route_to('projects#index')
    end

    it 'routes GET project_path(@project) to the /show action' do
      expect(get(project_path(@project))).to \
        route_to('projects#show', id: @project.url)
    end

    it 'routes GET edit_project_path(@project) to the /edit action' do
      expect(get(edit_project_path(@project))).to \
        route_to('projects#edit', id: @project.url)
    end

    it 'routes GET new_project_path to the /new action' do
      expect(get(new_project_path)).to \
        route_to('projects#new')
    end

    it 'routes POST project_path to the /create action' do
      expect(post(projects_path)).to \
        route_to('projects#create')
    end

    it 'routes DELETE project_path(@project) to the /destroy action' do
      expect(delete(project_path(@project))).to \
        route_to('projects#destroy', id: @project.url)
    end

    it 'routes PUT project_path(@project) to the /update action' do
      expect(put(project_path(@project))).to \
        route_to('projects#update', id: @project.url)
    end
  end
end
