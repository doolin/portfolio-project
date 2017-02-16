# frozen_string_literal: true
require 'spec_helper'

describe 'projects/index' do
  context 'with 2 projects' do
    before(:each) do
      @member   = FactoryGirl.create(:member)
      @slicer   = FactoryGirl.create(:project, name: 'Slicer', member: @member)
      @dicer    = FactoryGirl.create(:project, name: 'Dicer',  member: @member)
      @projects = Project.all
      sign_in @member
    end

    it 'renders a list of projects' do
      allow(view).to receive(:title).and_return('')
      allow(view).to receive(:gravatar_for).with(@member, size: '100').and_return('foo')
      render
      # http://groups.google.com/group/ruby-capybara/browse_thread/thread/944871152dae0272/9ca6dcaf173dab74
      # http://groups.google.com/group/ruby-capybara/msg/9ca6dcaf173dab74
      expect(rendered).to have_selector('h2.projects-listing')
      expect(rendered).to have_selector('p.project-summary')
    end
  end
end
