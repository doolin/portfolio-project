require 'spec_helper'

describe "pages/disclosure.html.erb" do
  it "should render the Terms page" do
    render
    rendered.should =~ /disclosure/
  end

  it "should have the correct <title> element " do
    render(:template => "pages/disclosure.html.erb", :layout => 'layouts/application')
    # have_selector is from webrat 
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector("title", :content => "Disclosure | Portfolio Project")
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end
