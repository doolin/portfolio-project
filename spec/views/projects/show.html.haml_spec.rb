# frozen_string_literal: true

require 'spec_helper'

describe 'projects/show' do
  before(:each) do
    allow(view).to receive(:title).and_return('')
    # p. 333 Lightbulb
    # assign(:project, mock_model(Project).as_new_record.as_null_object)
    @member = create(:member)
    @project   = create(:project, name: 'Slicer', member: @member)
    @profile   = create(:profile, member: @member)
    # sign_in @member
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('projects')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end

  it 'renders flash notices' do
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
    expect(rendered).to match(/Summary/)
    expect(rendered).to match(/Client/)
  end

  it 'has a description block for the project' do
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
    expect(Member).to receive(:find).with(@member.id).and_return(@member).exactly(2).times
    render
    expect(rendered).to have_selector('div.description')
  end

  it 'has a URI field for the project' do
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
    render
    expect(rendered).to have_selector('div.uri')
  end

  it 'has a Required Skills field for the project' do
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
    render
    render
    expect(rendered).to have_selector('div.requiredskills')
  end

  # If a field is nil, the .html_safe method doesn't work.
  # xit "handles an error if the skills field is blank"

  it 'does not have a foobar field for the project' do
    allow(view).to receive(:gravatar_for).with(@member, size: '140').and_return('foo')
    render
    expect(rendered).not_to have_selector('div.foobar')
  end
end
