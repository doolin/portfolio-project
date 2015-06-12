require 'spec_helper'

describe 'pages/about.html.erb' do
  it 'should render the About page' do
    render
    expect(rendered).to match(/About/)
  end

  xit 'should have the correct <title> element ' do
    render(:template => 'pages/about.html.erb', :layout => 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    expect(rendered).to have_selector('title', :text => 'About | Portfolio Project')

    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end
