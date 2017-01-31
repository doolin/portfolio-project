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
      allow(view).to receive(:title).and_return('')
    end

    it 'displays default scaffolding text' do
      render
      expect(rendered).to match(/Sales#new/)
    end

    # This passes but it shouldn't, false positive.
    xit 'has the correct <title> element ' do
      render(template: 'sales/new', layout: 'layouts/application')
      expect(rendered).to match('Premium Membership | Portfolio Project')
    end
  end
end
