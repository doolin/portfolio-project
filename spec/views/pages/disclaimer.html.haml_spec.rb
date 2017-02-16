# frozen_string_literal: true
require 'spec_helper'

describe 'pages/disclaimer' do
  it 'should render the Disclaimer page' do
    allow(view).to receive(:title).and_return('')
    render
    expect(rendered).to match(/Disclaimer/)
  end
end
