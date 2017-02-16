# frozen_string_literal: true
require 'spec_helper'

describe 'projects/edit' do
  before(:each) do
    allow(view).to receive(:title).and_return('')
    @member = FactoryGirl.create(:member)
    @project = FactoryGirl.create(:project, member: @member)
    sign_in @member
  end

  it 'renders the edit project form' do
    render
    expect(rendered).to have_selector('input', id: 'project_name') # , name: 'project[name]')
  end

  it 'renders the project name' do
    render
    expect(rendered).to have_selector('input', id: 'project_name')
  end
end
