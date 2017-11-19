# frozen_string_literal: true
require 'spec_helper'

describe 'projects/_form' do
  before(:each) do
    @member = create(:member)
    @project = create(:project, member: @member)
    sign_in @member
  end

  it 'renders the form' do
    render
    expect(rendered).to have_selector('div.field')
  end

  it 'has a Point of Contact field for the project' do
    render
    expect(rendered).to have_selector('input', id: 'project_pointofcontact')
  end

  it 'has a URI field for the project' do
    render
    expect(rendered).to have_selector('input', id: 'project_uri')
  end

  it 'has a Required Skills field for the project' do
    render
    expect(rendered).to have_selector('textarea', id: 'project_requiredskills')
  end
end
