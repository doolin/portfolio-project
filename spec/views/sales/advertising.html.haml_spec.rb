# frozen_string_literal: true
require 'spec_helper'

describe 'sales/advertising' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('sales')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('advertising')
  end

  describe '.rendered' do
    before do
      allow(view).to receive(:title).and_return(->{ 'Premium Membership' })
    end

    it 'should display advertising solicitation' do
      render
      expect(rendered).to match(/Buy Advertising on Portfolio Project/)
    end
  end
end
