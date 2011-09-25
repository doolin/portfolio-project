require 'spec_helper'

describe "pages/confirmation.html.erb" do
  it "should render the Confirmation page" do
    render
    rendered.should =~ /Subscription Confirmed/
  end
end
