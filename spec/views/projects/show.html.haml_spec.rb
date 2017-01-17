require 'spec_helper'

describe 'projects/show' do
  before(:each) do
    allow(view).to receive(:title).and_return('')
    # p. 333 Lightbulb
    # assign(:project, mock_model(Project).as_new_record.as_null_object)
    @member   = FactoryGirl.create(:member)
    @project   = FactoryGirl.create(:project, name: 'Slicer', member: @member)
    @profile   = FactoryGirl.create(:profile, member: @member)
    # sign_in @member
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('projects')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end

  it 'renders flash notices' do
    # allow(view).to receive(:title).and_return('')
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
    expect(Member).to receive(:find).with(@member.id).and_return(@member).exactly(2).times

    flash[:notice] = 'This is a notice!'
    render
    expect(rendered).to match(/This is a notice!/)
  end
  # end

  it 'renders attributes in <p>' do
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
    expect(Member).to receive(:find).with(@member.id).and_return(@member).exactly(2).times
    render
    # Name changed to h1 element
    # rendered.should match(/Name/)
    expect(rendered).to match(/Summary/)
    expect(rendered).to match(/Client/)
  end

  it 'has a description block for the project' do
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
    expect(Member).to receive(:find).with(@member.id).and_return(@member).exactly(2).times
    render
    expect(rendered).to have_selector('div.description')
  end

  xit 'has a URI field for the project' do
    render
    expect(rendered).to have_selector('div.uri')
  end

  xit 'has a Required Skills field for the project' do
    render
    expect(rendered).to have_selector('div.requiredskills')
  end

  # If a field is nil, the .html_safe method doesn't work.
  # xit "handles an error if the skills field is blank"

  xit 'does not have a foobar field for the project' do
    render
    expect(rendered).not_to have_selector('div.foobar')
  end

  xit 'should have the correct <title> element ' do
    render(template: 'projects/show.html.erb', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    expect(rendered).to have_selector('title', text: @project.name + ' | Portfolio Project')
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end
