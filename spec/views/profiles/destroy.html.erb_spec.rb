
require 'spec_helper'

describe 'profiles/destroy.html.erb' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('profiles')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('destroy')
  end

  xit 'renders the profile destroyed page' do
    render
    expect(rendered).to have_selector('h2', text: 'Thank you for your time')
  end
end
