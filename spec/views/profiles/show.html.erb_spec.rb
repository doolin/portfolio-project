require 'spec_helper'


describe 'profile/show.html.erb' do

  before(:each) do
    @project = assign(:profile, stub_model(Project,
      :new_record? => false,
      :name => "MyString",
    ))
  end

=begin  
  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("profile")
  end

  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq("show")
  end  
=end

  it "renders the member's profile page" do
    render
    rendered.should have_selector('a', :content => 'Edit')
  end

end

=begin
describe "profiles/_profile_links.html.erb" do
  
  it "should have text Projects" do
    pending "Projects as anchor text."  
  end
  
  it "should have a link to Projects" do
    pending "Add link to projects"
  end  
end    
=end 
