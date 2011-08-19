require 'spec_helper'

describe "pages/privacy.html.erb" do
  it "should render the Privacy page" do
    render
    rendered.should =~ /privacy/
  end
end
