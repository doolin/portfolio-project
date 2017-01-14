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

  # View specs don't load the controller so the helpers aren't loaded
  # either, hence this fails on no method error for title.
  # let(:title) { double String }
  it 'should display the home page' do

    # allow(controller).to receive(:title).and_return('123')

    member = Member.new id: 1

    allow(view).to receive(:title).and_return('foo')
    allow(view).to receive(:devise_error_messages!).and_return([])

    ### This one next...
    # allow(view).to receive(:link_to).with(anything).and_return(nil)

    allow(view).to receive(:gravatar_for).with(member, {:size=>"200"}).and_return('foo')
    # allow(view).to receive(:gravatar_for).with(anything).and_return('foo')

    # view.stub(:profiles).and_return([])
    profile = Profile.new id: 1, member_id: 1, created_at: Time.now.utc

    # allow(view).to receive(:pluralize).with(anything).and_return('foo')
    allow(view).to receive(:pluralize).with(0, 'project').and_return('foo')

    # expect(Profile).to receive(:find).with(anything).and_return(profile)
    expect(Profile).to receive(:find).with(anything).and_return(profile).exactly(4).times

    # expect(Member).to receive(:find).with(nil).and_return(Member.new)
    expect(Member).to receive(:find).with(member.id).and_return(member).exactly(8).times

    allow(member).to receive(:projects).and_return(projects = [Project.new])
    allow(projects).to receive(:count).and_return(0)

    render
    # ap rendered.class
    expect(rendered).to match(/Talk is cheap/)
    expect(rendered).not_to match(/Getta buncha/)
  end

  xit 'should have the correct <title> element ' do
    @projects = double(Project).as_null_object
    render(template: 'sales/index.html.erb', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    rendered.should have_selector('title', text: 'Your Accomplishments Matter | Portfolio Project')
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end
