require 'spec_helper'

describe "pages/about.html.erb" do
  it "should render the About page" do
    render
    rendered.should =~ /About/
  end
end
