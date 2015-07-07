require 'spec_helper'

describe 'profiles/show.html.erb' do
  before(:each) do
    @member = FactoryGirl.create(:member)
    @profile = FactoryGirl.create(:profile, member: @member, created_at: 1.day.ago)
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

  xit 'should have the correct <title> element ' do
    render(template: 'profiles/show.html.erb', layout: 'layouts/application')
    title = @member.firstname + ' ' + @member.lastname.possessive + ' Profile | Portfolio Project'
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    expect(rendered).to have_selector('title', text: title)
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end

  it 'should have a link to Twitter profile' do
    render
    expect(rendered).to have_selector('a.twitter', text: @member.profile.twitter)
  end

  # This is a brittle spec, depending on the word "profile" is not good.
  it 'should have a link to Google Profile' do
    render
    expect(rendered).to have_selector('a', text: 'profile')
    # rendered.should =~ /profile/
  end

  xit 'should not display Google Profile information when no link' do
    @member.profile.gprofile_url = ''
    @member.save
    render
    # rendered.should_not have_selector('a.gprofile', :content => 'profile')
    expect(rendered).to match(/no Google profile given/)
  end
end

# These may be producing false positives.
describe 'profiles/_profile_links.html.erb' do
  before(:each) do
    @member = FactoryGirl.create(:member)
    @profile = FactoryGirl.create(:profile, member: @member, created_at: 1.day.ago)
    @project = FactoryGirl.create(:project, member: @member)
    sign_in @member
  end

  it 'should have link to Edit' do
    render
    expect(rendered).to have_selector('a', text: 'Edit')
  end

  it 'signed out should not have link to Edit' do
    sign_out @member
    render
    expect(rendered).to_not have_selector('a', text: 'Edit')
  end

  xit 'should have link to Delete' do
    render
    expect(rendered).to have_selector('a', text: 'Delete')
  end

  it 'should have a link to Projects' do
    render
    expect(rendered).to have_selector('a', text: 'Projects')
  end

  it 'should have a link to Settings' do
    render
    expect(rendered).to have_selector('a.settings', text: 'Settings')
  end
end
