require 'spec_helper'

describe 'members/show' do
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

  xit "renders the member's show page" do
    render
    expect(rendered).to match(/Projects/)
  end

  xit 'should have link to New Project' do
    render
    expect(rendered).to have_selector('div') do |n|
      # This is giving me a false positive, passing on any
      # valid href or content whether that href or content
      # is in the actual link on the view template.
      n.should have_selector('a', href: '/projects/new', text: 'New Project')
    end
  end

  # Cannot seem to find the correct title
  xit 'should have the correct <title> element ' do
    @member.firstname = 'Foo'
    @member.lastname = 'Bar'
    render(template: 'members/show', layout: 'layouts/application')
    # title = "#{@member.firstname} #{@member.lastname} | Portfolio Project"
    title = "\nYour Accomplishments\n| Portfolio Project\n"

    expect(rendered).to have_selector('title', text: title, visible: false)
  end
end
