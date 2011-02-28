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

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
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


describe "projects/_form.html.erb" do
  it "includes a link to new" do
    pending "Not clear what Relishapp wants here (http://relishapp.com/rspec/rspec-rails/v/2-5/dir/view-specs/view-spec-infers-controller-path-and-action)"
    controller.request.path_parameters["action"].should be_nil
  end
end
    
end
