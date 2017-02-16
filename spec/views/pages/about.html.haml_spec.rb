# frozen_string_literal: true
require 'spec_helper'

describe 'pages/about' do
  it 'renders the About page' do
    allow(view).to receive(:title).and_return('About')
    render
    expect(rendered).to match(/About/)
  end
end
