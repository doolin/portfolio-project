require 'spec_helper'

describe "pages/disclaimer.html.erb" do
  it "should render the Disclaimer page" do
    render
    rendered.should =~ /Disclaimer/
  end
end
