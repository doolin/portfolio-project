require 'spec_helper'

describe 'sales/index' do
  before(:each) do
    @member  = FactoryGirl.create(:member)
    @project = FactoryGirl.create(:project, name: 'Slicer', member: @member)
    @profile = FactoryGirl.create(:profile, member: @member)
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('sales')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  xit 'should display the home page' do
    render
    expect(rendered).to match(/Talk is cheap/)
    expect(rendered).not_to match(/Getta buncha/)
  end

  xit 'should have the correct <title> element ' do
    @projects = double(Project).as_null_object
    render(template: 'sales/index.html.erb', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector('title', text: 'Your Accomplishments Matter | Portfolio Project')
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end
