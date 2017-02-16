# frozen_string_literal: true
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

  it 'should display the home page' do
    member = Member.new id: 1
    profile = Profile.new id: 1, member_id: 1, created_at: Time.now.utc

    allow(view).to receive(:title).and_return('foo')
    allow(view).to receive(:devise_error_messages!).and_return([])
    allow(view).to receive(:gravatar_for).with(member, size: '200').and_return('foo')
    allow(view).to receive(:pluralize).with(0, 'project').and_return('foo')
    allow(member).to receive(:projects).and_return(projects = [Project.new])
    allow(projects).to receive(:count).and_return(0)

    expect(Profile).to receive(:find).with(anything).and_return(profile).exactly(4).times
    expect(Member).to receive(:find).with(member.id).and_return(member).exactly(8).times

    render

    expect(rendered).to match(/Talk is cheap/)
    expect(rendered).not_to match(/Getta buncha/)
  end
end
