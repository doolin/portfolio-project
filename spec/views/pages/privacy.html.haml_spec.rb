# frozen_string_literal: true
require 'spec_helper'

describe 'pages/privacy' do
  it 'should render the Privacy page' do
    allow(view).to receive(:title).and_return('')
    render
    expect(rendered).to match(/privacy/)
  end
end
