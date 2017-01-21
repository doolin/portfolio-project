require 'spec_helper'

describe 'pages/terms' do
  it 'should render the Terms page' do
    allow(view).to receive(:title).and_return('')
    render
    expect(rendered).to match(/terms/)
  end

  xit 'should have the correct <title> element ' do
    allow(view).to receive(:title).with(anything).and_return(anything)
    render(template: 'pages/terms', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    expect(rendered).to have_selector('title', text: 'Terms and Conditions | Portfolio Project', visible: false)
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end
