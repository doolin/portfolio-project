require 'spec_helper'

describe 'projects/show.html.erb' do
  before(:each) do
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

  # describe 'layouts/application' do
  # https://github.com/rspec/rspec-rails/issues/176
  it 'renders flash notices' do
    flash[:notice] = 'This is a notice!'
    render
    # response.should contain "This is a notice!"
    expect(rendered).to match(/This is a notice!/)
  end
  # end

  it 'renders attributes in <p>' do
    render
    # Name changed to h1 element
    # rendered.should match(/Name/)
    expect(rendered).to match(/Summary/)
    expect(rendered).to match(/Client/)
  end

  it 'has a description block for the project' do
    render
    expect(rendered).to have_selector('div.description')
  end

  it 'has a URI field for the project' do
    render
    expect(rendered).to have_selector('div.uri')
  end

  it 'has a Required Skills field for the project' do
    render
    expect(rendered).to have_selector('div.requiredskills')
  end

  # If a field is nil, the .html_safe method doesn't work.
  # xit "handles an error if the skills field is blank"

  it 'does not have a foobar field for the project' do
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
