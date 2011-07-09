require 'spec_helper'

describe "projects/edit.html.erb" do
  
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :new_record? => false,
      :name => "MyString",
      :summary => "MyString",
      :client => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
      assert_select "form", :action => edit_projects_path(@project), :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_summary", :name => "project[summary]"
      assert_select "input#project_client", :name => "project[client]"
    end
  end
end
