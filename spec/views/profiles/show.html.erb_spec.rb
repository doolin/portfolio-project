require 'spec_helper'


describe 'profiles/show.html.erb' do

  before(:each) do
    @member = Factory(:member)
    @profile = Factory(:profile, :member => @member, :created_at => 1.day.ago)
  end

  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("profiles")
  end

  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq("show")
  end  

  it "renders the member's profile page" do
    render
    rendered.should have_selector('div.profile')
  end

end


describe "profiles/_profile_links.html.erb" do
  
  before(:each) do
    @member = Factory(:member)
    @profile = Factory(:profile, :member => @member, :created_at => 1.day.ago)
    @project = Factory(:project, :member => @member)
    sign_in @member
  end

  it "should have link to Edit" do
    render
    rendered.should have_selector('a', :content => 'Edit')
  end
  
  it "should have link to Delete" do
    render
    rendered.should have_selector('a', :content => 'Delete')
  end
  
  it "should have a link to Projects" do
    render
    rendered.should have_selector('a', :content => 'Projects')
  end  
end