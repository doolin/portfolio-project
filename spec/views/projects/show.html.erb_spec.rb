require 'spec_helper'

describe 'projects/show.html.erb' do

  before(:each) do
    # p. 333 Lightbulb
    assign(:project, mock_model(Project).as_new_record.as_null_object)
  end

  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("projects")
  end

  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq("show")
  end


  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
    rendered.should match(/Summary/)
    rendered.should match(/Client/)
  end

  it "has a description block for the project" do
    render
    rendered.should have_selector('div.description')
  end

  it "has a URI field for the project" do
    render
    rendered.should have_selector('div.uri')
  end

  it "does not have a foobar field for the project" do
    render
    rendered.should_not have_selector('div.foobar')
  end

end
