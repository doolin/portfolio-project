# frozen_string_literal: true

require 'spec_helper'

describe 'pages/confirmation' do
  it 'should render the Confirmation page' do
    allow(view).to receive(:title).and_return('')
    render
    expect(rendered).to match(/Subscription Confirmed/)
  end
end
