require 'spec_helper'

describe 'members/show.html.erb' do
  before(:each) do
    @member = FactoryGirl.create(:member)
    @profile = FactoryGirl.create(:profile, member: @member, created_at: 1.day.ago)
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

  xit 'should have the correct <title> element ' do
    @member.firstname = 'Foo'
    @member.lastname = 'Bar'
    render(template: 'members/show.html.erb', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    title = "#{@member.firstname} #{@member.lastname} | Portfolio Project"
    #rendered.should have_selector("title", :content => "Dave Doolin | Portfolio Project")
    expect(rendered).to have_selector('title', text: title)
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    #view.content_for(:sidebar).should have_selector('div.quote')
  end
end
