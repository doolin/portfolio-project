# frozen_string_literal: true
require 'spec_helper'

describe 'pages/about' do
  it 'renders the About page' do
    allow(view).to receive(:title).and_return('About')
    render
    expect(rendered).to match(/About/)
  end

  xit 'should have the correct <title> element ' do
    allow(view).to receive(:title).and_return('About')
    render
    render(template: 'pages/about', layout: 'layouts/application')
    # http://stackoverflow.com/questions/8014038/rails-3-rspec-2-testing-content-for
    view.content_for(:title).should match('MainHeader')

    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    expect(rendered).to have_selector('title', text: 'About | Portfolio Project')

    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end
