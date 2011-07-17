require 'spec_helper'


describe "projects/new.html.erb" do

  # All this machinery here may be replaceable with a Factory
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :summary => "MyString",
      :client => "MyString"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # TODO: Switch all of this to Capybara/RSpec once the 'within' issue is solved
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
    controller.request.path_parameters["controller"].should eq("projects")
  end
  
  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq("new")
  end
    
end
