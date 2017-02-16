# frozen_string_literal: true
require 'spec_helper'

describe 'pages/terms' do
  it 'should render the Terms page' do
    allow(view).to receive(:title).and_return('')
    render
    expect(rendered).to match(/terms/)
  end
end
