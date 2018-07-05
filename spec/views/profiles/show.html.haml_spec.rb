# frozen_string_literal: true

require 'spec_helper'

describe 'profiles/show' do
  before(:each) do
    @member = create :member
    @profile = create :profile, member: @member, created_at: 1.day.ago
    allow(view).to receive(:title).and_return('')
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('profiles')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end

  it "renders the member's profile page" do
    render
    expect(rendered).to have_selector('div.profile')
  end

  it 'has a link to Twitter profile' do
    render
    expect(rendered).to have_selector('a.twitter', text: @member.profile.twitter)
  end

  it 'has a link to Google Profile' do
    render
    expect(rendered).to have_selector('a', text: 'profile')
  end

  it 'does not display Google Profile information when no link' do
    @member.profile.gprofile_url = ''
    @member.save
    render
    expect(rendered).to match(/no Google profile given/)
  end
end

# These may be producing false positives.
describe 'profiles/_profile_links' do
  before(:each) do
    @member = create :member
    @profile = create :profile, member: @member, created_at: 1.day.ago
    @project = create :project, member: @member
    allow(view).to receive(:title).and_return('')
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
    sign_in @member
  end

  context 'signed in' do
    it 'has link to Edit' do
      render
      expect(rendered).to have_selector('a', text: 'Edit')
    end

    it 'has link to Delete' do
      render
      expect(rendered).to have_selector('a', text: 'Delete')
    end

    it 'has a link to Projects' do
      render
      expect(rendered).to have_selector('a', text: 'Projects')
    end

    it ' has a link to Settings' do
      render
      expect(rendered).to have_selector('a.settings', text: 'Settings')
    end
  end

  context 'signed out' do
    it 'signed out should not have link to Edit' do
      sign_out @member
      render
      expect(rendered).to_not have_selector('a', text: 'Edit')
    end
  end
end
