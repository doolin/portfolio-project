require "spec_helper"

describe ProjectsController do

  describe "routing, explicit, long form" do

    it "recognizes and generates #index" do
      { :get => "/projects" }.should route_to(:controller => "projects", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/projects/new" }.should route_to(:controller => "projects", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/projects/1" }.should route_to(:controller => "projects", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/projects/1/edit" }.should route_to(:controller => "projects", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/projects" }.should route_to(:controller => "projects", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/projects/1" }.should route_to(:controller => "projects", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/projects/1" }.should route_to(:controller => "projects", :action => "destroy", :id => "1")
    end

  end


  describe "routing short form, url redirect" do

    before(:each) do
      @project = Project.create(:name => 'New project')
    end

    it "routes GET projects_path to the /index action" do
      get(projects_path).should \
        route_to('projects#index')
    end

    it "routes GET project_path(@project) to the /show action" do
      get(project_path(@project)).should \
        route_to('projects#show', :id => @project.url)
    end

    it "routes GET edit_project_path(@project) to the /edit action" do
      get(edit_project_path(@project)).should \
        route_to('projects#edit', :id => @project.url)
    end

    it "routes GET new_project_path to the /new action" do
      get(new_project_path).should \
        route_to('projects#new')
    end

    it "routes POST project_path to the /create action" do
      post(projects_path).should \
        route_to('projects#create')
    end

    it "routes DELETE project_path(@project) to the /destroy action" do
      delete(project_path(@project)).should \
        route_to('projects#destroy', :id => @project.url)
    end

    it "routes PUT project_path(@project) to the /update action" do
      put(project_path(@project)).should \
        route_to('projects#update', :id => @project.url)
    end

  end

end
