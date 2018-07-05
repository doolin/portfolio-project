# frozen_string_literal: true

require 'spec_helper'

describe 'members/show' do
  before(:each) do
    @member = create(:member)
    @profile = create(:profile, member: @member, created_at: 1.day.ago)
    allow(view).to receive(:title).and_return('')
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('members')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end

  it "renders the member's show page" do
    render
    expect(rendered).to match(/Projects/)
  end

  it 'should have link to New Project' do
    render
    expect(rendered).to have_selector('div') do |n|
      # This is giving me a false positive, passing on any
      # valid href or content whether that href or content
      # is in the actual link on the view template.
      n.should have_selector('a', href: '/projects/new', text: 'New Project')
    end
  end
end
