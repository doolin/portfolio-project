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

  xit 'should have the correct <title> element ' do
    render(template: 'projects/edit.html.erb', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector('title', text: 'Edit ' + @project.name + ' | Portfolio Project')
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end
