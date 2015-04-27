require 'spec_helper'

describe "projects/new.html.erb" do
  # All this machinery here may be replaceable with a Factory
  before(:each) do
    assign(:project, Project.new(:name => "MyString", :summary => "MyString", :client => "MyString"))
  end

  it "renders new project form" do
    render

    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "textarea#project_summary", :name => "project[summary]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_client", :name => "project[client]"
      assert_select "input#project_pointofcontact", :name => "project[pointofcontact]"
      assert_select "input#project_tags", :name => "project[tags]"
    end
  end

  it "infers the controller path" do
    controller.request.path_parameters[:controller].should eq("projects")
  end

  it "infers the controller action" do
    controller.request.path_parameters[:action].should eq("new")
  end

  xit "should have the correct <title> element " do
    render(:template => "projects/new.html.erb", :layout => 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector("title", :text => "Add your new Project or Accomplishment | Portfolio Project")
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end
