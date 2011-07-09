
require 'spec_helper'

describe "profiles/destroy.html.erb" do

  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("profiles")
  end
  
  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq("destroy")
  end

  it "renders the profile destroyed page" do
    render
    rendered.should have_selector('h2', :content => 'Thank you for your time')
  end

end
