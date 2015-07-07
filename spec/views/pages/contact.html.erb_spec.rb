require 'spec_helper'

describe 'pages/contact.html.erb' do
  it 'should render the Contact page' do
    render
    expect(rendered).to match(/Contact/)
  end

  xit 'should have the correct <title> element ' do
    render(template: 'pages/contact.html.erb', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector('title', text: 'Contact | Portfolio Project')
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end
