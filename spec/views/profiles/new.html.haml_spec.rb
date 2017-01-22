require 'spec_helper'

describe 'profiles/new' do
  before(:each) do
    assign(:profile, Profile.new(firstname: 'Dave', lastname: 'Doolin', url: 'doolin'))
    allow(view).to receive(:title).and_return('')
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('profiles')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end

  it 'renders the new Profile page' do
    render
    expect(rendered).to match(/New profile/)
  end

  it 'renders included form' do
    render
    expect(rendered).to match(/Firstname/)
  end

  xit 'should have the correct <title> element ' do
    render(template: 'profiles/new.html.erb', layout: 'layouts/application')
    # have_selector is from webrat
    # https://github.com/brynary/webrat/blob/master/lib/webrat/core/matchers/have_selector.rb
    expect(rendered).to have_selector('title', text: 'Create your Profile | Portfolio Project')
    # http://blog.carbonfive.com/2011/03/02/a-look-at-specifying-views-in-rspec/
    # view.content_for(:sidebar).should have_selector('div.quote')
  end
end

describe 'profiles/_form' do
  before(:each) do
    assign(:profile, Profile.new(firstname: 'Dave', lastname: 'Doolin', url: 'doolin'))
  end

  it 'form contains input element for Firstname' do
    render
    assert_select 'form', action: profiles_path, method: 'post' do
      assert_select 'input#profile_firstname', name: 'profile[firstname]'
    end
  end

  it 'form contains input element for Lastname' do
    render
    assert_select 'form', action: profiles_path, method: 'post' do
      assert_select 'input#profile_lastname', name: 'profile[lastname]'
    end
  end
end
