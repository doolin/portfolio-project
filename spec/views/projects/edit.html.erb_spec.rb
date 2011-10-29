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

  it "should have the correct <title> element " do
    render(:template => "projects/edit.html.erb", :layout => 'layouts/application')
    # have_selector is from webrat 
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector("title", :content => 'Edit ' + @project.name + " | Portfolio Project")
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end
