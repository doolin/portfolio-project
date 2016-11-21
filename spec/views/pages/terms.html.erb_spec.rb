require 'spec_helper'

describe 'pages/terms.html.erb' do
  xit 'should render the Terms page' do
    render
    expect(rendered).to match(/terms/)
  end

  xit 'should have the correct <title> element ' do
    render(template: 'pages/terms.html.erb', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    expect(rendered).to have_selector('title', text: 'Terms and Conditions | Portfolio Project')
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end
