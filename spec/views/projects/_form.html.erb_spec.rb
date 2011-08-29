require 'spec_helper'

# Rudimentary example for partials processing.

describe "projects/_form.html.erb" do
  
  before(:each) do
    @member = Factory(:member)
    @project = Factory(:project, :member => @member)
    sign_in @member
  end

  
  it "renders the form" do
    render
    rendered.should have_selector('div.field')
  end

  it "has a Point of Contact field for the project" do
    render
    rendered.should have_selector('input', :name => 'project[pointofcontact]')
  end

  it "has a URI field for the project" do
    render
    rendered.should have_selector('input', :name => 'project[uri]')
  end

end

=begin
<div class="field"> 
    <label for="project_Point of contact">Point of contact</label><br /> 
    <input id="project_pointofcontact" name="project[pointofcontact]" size="30" type="text" /> 
  </div>
=end