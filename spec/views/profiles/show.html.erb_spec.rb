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

  xit "should have the correct <title> element " do
    render(:template => "profiles/show.html.erb", :layout => 'layouts/application')
    # have_selector is from webrat 
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector("title", :content => "Privacy | Portfolio Project")
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
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