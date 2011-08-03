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

  xit "renders the member's profile page" do
    
    render
    rendered.should have_selector('a', :content => 'Edit')
  end

end


describe "profiles/_profile_links.html.erb" do
  
  it "should have link to Edit" do
    #pending "Projects as anchor text."
      controller.request.path_parameters["controller"].should eq("profiles")
      controller.request.path_parameters["action"].should be_nil
#    render
#    rendered.should have_selector('a', :content => 'Edit')
  end
  
  it "should have a link to Projects" do
    pending "Add link to projects"
  end  
end    


=begin
 
 From  http://rubyforge.org/pipermail/rspec-users/2011-July/020315.html

 You _can_ use shared content, but what you have here ^^ doesn't work as written. The scope in the shared_examples_for block is an example group scope, not an example scope, so methods like fill_in and click_button are not available. You'd want to wrap them in a before block. Also, page.has_content?(...) will return true or false, but will not act like an expectation (i.e. RSpec won't care which it returns).

Here are a couple of ways you could do this that will work as Chris expects:

shared_context "logged in" do
 let(:user) { Factory(:user) }
 before do
   fill_in :login, :with => user.email
   fill_in :password, :with => user.password
   click_button "login_button"
 end
end

describe ArticlesController do
 include_context "logged in"
 describe "GET edit" do
   it "does something" do
     # here the shared before hook has already run
     # and you have access to the `user` generated
     # by the `let` declaration.
   end
 end
end
 
=end