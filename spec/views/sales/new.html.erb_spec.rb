require 'spec_helper'

describe 'sales/new' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('sales')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end

  it 'should display default scaffolding text' do
    allow(view).to receive(:title).and_return('')
    render
    expect(rendered).to match(/Sales#new/)
  end

  # This passes but it shouldn't.
  xit 'should have the correct <title> element ' do
    allow(view).to receive(:title).and_return('')
    render(template: 'sales/new', layout: 'layouts/application')
    expect(rendered).to match('Premium Membership | Portfolio Project')
  end
end
