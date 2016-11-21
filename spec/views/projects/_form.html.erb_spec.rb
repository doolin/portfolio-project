require 'spec_helper'

describe 'projects/_form.html.erb' do
  before(:each) do
    @member = FactoryGirl.create(:member)
    @project = FactoryGirl.create(:project, member: @member)
    sign_in @member
  end

  xit 'renders the form' do
    render
    expect(rendered).to have_selector('div.field')
  end

  # These all used to work, will need to figure out the latest way
  # to write these tests.
  xit 'has a Point of Contact field for the project' do
    render
    rendered.should have_selector('input', text: 'project[pointofcontact]')
  end

  xit 'has a URI field for the project' do
    render
    rendered.should have_selector('input', text: 'project[uri]')
  end

  xit 'has a Required Skills field for the project' do
    render
    rendered.should have_selector('textarea', text: 'project[requiredskills]')
  end
end
