# frozen_string_literal: true

require 'spec_helper'

describe 'projects/new' do
  before(:each) do
    assign(:project, Project.new(name: 'MyString', summary: 'MyString', client: 'MyString'))
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('projects')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end

  it 'renders new project form' do
    allow(view).to receive(:title).and_return('')
    render

    assert_select 'form', action: projects_path, method: 'post' do
      assert_select 'input#project_name', name: 'project[name]'
      assert_select 'textarea#project_summary', name: 'project[summary]'
      assert_select 'textarea#project_description', name: 'project[description]'
      assert_select 'input#project_client', name: 'project[client]'
      assert_select 'input#project_pointofcontact', name: 'project[pointofcontact]'
      assert_select 'input#project_tags', name: 'project[tags]'
    end
  end
end
