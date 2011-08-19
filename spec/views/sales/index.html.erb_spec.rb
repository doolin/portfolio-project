require 'spec_helper'

describe "sales/index.html.erb" do

  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq('sales')
  end

  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq('index')
  end

  it "should display the home page" do
    render
    rendered.should =~ /Talk is cheap/
  end

end

=begin

 Moved here to keep track of things as pending and errors
 get worked through.

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