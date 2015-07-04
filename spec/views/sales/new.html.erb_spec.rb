require 'spec_helper'

describe 'sales/new.html.erb' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('sales')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end

  it 'should display default scaffolding text' do
    render
    expect(rendered).to match(/Sales#new/)
  end

  it 'should have the correct <title> element ' do
    render(template: 'sales/new.html.erb', layout: 'layouts/application')
    expect(rendered).to match('Premium Membership | Portfolio Project')
  end
end
