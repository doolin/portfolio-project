require 'spec_helper'
#require 'capybara/rails'

describe "projects/edit.html.erb" do

  before(:each) do
    @member = Factory(:member)
    @project = Factory(:project, :member => @member)
    sign_in @member
  end

  it "renders the edit project form" do
    render
    # Keep an eye on the project_paths value, ensure it's 
    # hitting the correct action.
    rendered.should have_selector('form', :method => 'post', :action => projects_path)
    rendered.should have_selector('input', :id => 'project_name', :name => 'project[name]')
  end
  
end
