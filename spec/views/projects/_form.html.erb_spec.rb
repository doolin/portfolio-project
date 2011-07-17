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

end
