require 'spec_helper'

describe "pages/contact.html.erb" do
  it "should render the Contact page" do
    render
    rendered.should =~ /Contact/
  end
end
