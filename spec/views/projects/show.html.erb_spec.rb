require 'spec_helper'

describe "projects/show.html.erb" do

  before(:each) do
    @member = Factory(:member)
    @project = Factory(:project, :member => @member)
    sign_in @member
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
    rendered.should match(/Summary/)
    rendered.should match(/Client/)
  end

  xit "has a URI field for the project" do
    render
    rendered.should have_selector('input', :name => 'project[uri]')
  end

end
