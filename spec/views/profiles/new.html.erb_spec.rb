
require 'spec_helper'

describe "profiles/new.html.erb" do
  
  before(:each) do
    assign(:profile, stub_model(Profile,
      :firstname => "Dave",
      :lastname => "Doolin",
      :url => "doolin"
    ).as_new_record)
  end

  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("profiles")
  end
  
  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq("new")
  end

  it "renders the new Profile page" do
    render
    rendered.should =~ /New profile/
  end

  it "renders included form" do
    render
    rendered.should =~ /Firstname/
  end

  it "should have the correct <title> element " do
    render(:template => "profiles/new.html.erb", :layout => 'layouts/application')
    # have_selector is from webrat 
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector("title", :content => "Create your Profile | Portfolio Project")
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end

describe "profiles/_form.html.erb" do

  before(:each) do
    assign(:profile, stub_model(Profile,
      :firstname => "Dave",
      :lastname => "Doolin",
      :url => "doolin"
    ).as_new_record)
  end

  it "form contains input element for Firstname" do
    render
    assert_select "form", :action => profiles_path, :method => "post" do
      assert_select "input#profile_firstname", :name => "profile[firstname]"
    end
  end

  it "form contains input element for Lastname" do
    render
    assert_select "form", :action => profiles_path, :method => "post" do
      assert_select "input#profile_lastname", :name => "profile[lastname]"
    end
  end
end
