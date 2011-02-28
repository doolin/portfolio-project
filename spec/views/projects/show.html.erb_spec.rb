require 'spec_helper'

describe "projects/show.html.erb" do

  before(:each) do
    @member = Factory(:member)
    @project = Factory(:project, :member => @member)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Summary/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Client/)
  end
end
