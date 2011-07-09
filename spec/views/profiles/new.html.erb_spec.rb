
require 'spec_helper'

describe "profiles/new.html.erb" do
  
  before(:each) do
    assign(:profile, stub_model(Profile,
      :firstname => "Dave",
      :lastname => "Doolin",
      :url => "doolin"
    ).as_new_record)
  end

  # TODO: Finish adding fields to Profile form.
  it "renders new profile form" do
    render
    assert_select "form", :action => profiles_path, :method => "post" do
      assert_select "input#profile_firstname", :name => "profile[firstname]"
    end
  end
  
  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("profiles")
  end
  
  it "infers the controller action" do
    controller.request.path_parameters["action"].should eq("new")
  end

end 

describe "profiles/_form.html.erb" do
  it "includes a link to new" do
    pending "Not clear what Relishapp wants here (http://relishapp.com/rspec/rspec-rails/v/2-5/dir/view-specs/view-spec-infers-controller-path-and-action)"
    controller.request.path_parameters["action"].should be_nil
  end
end
