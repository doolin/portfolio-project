# frozen_string_literal: true

require 'spec_helper'

describe 'sales/new' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('sales')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end

  describe '.rendered' do
    before do
      allow(view).to receive(:title).with('Premium Membership').and_return('Premium Membership | Portfolio Project')
    end

    it 'displays default scaffolding text' do
      render
      expect(rendered).to match(/Sales#new/)
    end
  end
end
