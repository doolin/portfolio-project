require 'spec_helper'

describe "sales/index.html.erb" do
  before(:each) do
    @member   = FactoryGirl.create(:member)
    @project   = FactoryGirl.create(:project, :name => 'Slicer', :member => @member)
    @profile   = FactoryGirl.create(:profile, :member => @member)
  end

  it "infers the controller path" do
    expect(controller.request.path_parameters[:controller]).to eq('sales')
  end

  it "infers the controller action" do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  xit "should display the home page" do
    @projects = double(Project).as_null_object
    @profiles = double(Profile).as_null_object
    render
    expect(rendered).to match(/Talk is cheap/)
    expect(rendered).not_to match(/Getta buncha/)
  end

  xit "should have the correct <title> element " do
    @projects = double(Project).as_null_object
    render(:template => "sales/index.html.erb", :layout => 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector("title", :text => "Your Accomplishments Matter | Portfolio Project")
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end

=begin
Moved here to keep track of things as pending and errors
get worked through.

From  http://rubyforge.org/pipermail/rspec-users/2011-July/020315.html

You _can_ use shared content, but what you have here ^^ doesn't work as
written. The scope in the shared_examples_for block is an example group scope,
not an example scope, so methods like fill_in and click_button are not
available. You'd want to wrap them in a before block. Also,
page.has_content?(...) will return true or false, but will not act like an
expectation (i.e. RSpec won't care which it returns).

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
