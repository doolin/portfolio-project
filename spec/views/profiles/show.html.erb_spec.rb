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

  it "should have the correct <title> element " do
    render(:template => "profiles/show.html.erb", :layout => 'layouts/application')
    title = @member.firstname + " " + @member.lastname.possessive + ' Profile | Portfolio Project'
    # have_selector is from webrat 
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector("title", :content => title)
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end

  it "should have a link to Twitter profile" do
    render
    rendered.should have_selector('a.twitter', :content => @member.profile.twitter)
  end

  # This is a brittle spec, depending on the word "profile" is not good.
  it "should have a link to Google Profile" do
    render
    rendered.should have_selector('a', :content => 'profile')
    #rendered.should =~ /profile/
  end

  xit "should not display Google Profile information when no link" do
    @member.profile.gprofile_url = ''
    @member.save
    render
    #rendered.should_not have_selector('a.gprofile', :content => 'profile')
    rendered.should =~ /no Google profile given/
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
  
  it "signed out should not have link to Edit" do
    sign_out @member
    render
    rendered.should have_selector('a', :content => 'Edit')
  end

  xit "should have link to Delete" do
    render
    rendered.should have_selector('a', :content => 'Delete')
  end
  
  it "should have a link to Projects" do
    render
    rendered.should have_selector('a', :content => 'Projects')
  end  

end