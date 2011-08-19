require 'spec_helper'

describe "pages/disclosure.html.erb" do
  it "should render the Terms page" do
    render
    rendered.should =~ /disclosure/
  end
end
