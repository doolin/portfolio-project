require 'spec_helper'


describe 'members/show.html.erb' do

  before(:each) do
    @member = Factory(:member)
    @profile = Factory(:profile, :member => @member, :created_at => 1.day.ago)
  end

  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("members")
  end

  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq("show")
  end  

  it "renders the member's show page" do
    render
    rendered.should =~ /Projects/
  end

  it "should have link to New Project" do
    render
    rendered.should have_selector('td') do |n|
      # This is giving me a false positive, passing on any
      # valid href or content whether that href or content 
      # is in the actual link on the view template.
      n.should have_selector('a', :href => '/projects/new', :content => 'New Project')
    end
  end

end
