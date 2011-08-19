require 'spec_helper'

describe "pages/terms.html.erb" do
  it "should render the Terms page" do
    render
    rendered.should =~ /terms/
  end
end