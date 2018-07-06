# frozen_string_literal: true

require 'spec_helper'

describe 'pages/contact' do
  it 'should render the Contact page' do
    allow(view).to receive(:title).and_return('')
    render
    expect(rendered).to match(/Contact/)
  end
end
