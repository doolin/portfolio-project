require 'spec_helper'

describe 'sales/advertising' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('sales')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('advertising')
  end

  it 'should display advertising solicitation' do
    allow(view).to receive(:title).and_return('')
    render
    expect(rendered).to match(/Buy Advertising on Portfolio Project/)
  end

  xit 'should have the correct <title> element ' do
    allow(view).to receive(:title).and_return('')
    render(template: 'sales/advertising', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    # expect(rendered).to have_selector('title', text: 'Advertising | Portfolio Project', visible: false)
    expect(rendered).to have_selector('title', text: "\nYour Accomplishmentss\n| Portfolio Project\n", visible: false)
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end
