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
    # Keep an eye on the project_paths value, it uses the extended
    # url created from stringex and to_param (?). 
    # TODO: figure out how to get the url
    rendered.should have_selector('form', :method => 'post')
    rendered.should have_selector('input', :id => 'project_name', :name => 'project[name]')
  end
  
  it "renders the project name" do
    render
    rendered.should have_selector('input', :id => 'project_name', :name => 'project[name]')
  end

end
