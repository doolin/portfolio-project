# frozen_string_literal: true
require 'spec_helper'

describe 'routes for Profiles (long form)' do
  it 'routes GET /profiles to the profiles /index page' do
    expect(get: '/profiles').to route_to(controller: 'profiles', action: 'index')
  end

  it 'routes GET /profiles/bar to the /show action' do
    expect(get: '/profiles/bar').to route_to(controller: 'profiles', action: 'show', id: 'bar')
  end

  it 'routes GET /profiles/bar/edit to the /edit action' do
    expect(get: '/profiles/bar/edit').to route_to(controller: 'profiles', action: 'edit', id: 'bar')
  end

  it 'routes GET /profiles/new to the /new action' do
    expect(get: '/profiles/new').to route_to(controller: 'profiles', action: 'new')
  end

  it 'routes POST /profiles/ to the /create action' do
    expect(post: '/profiles').to route_to(controller: 'profiles', action: 'create')
  end

  it 'routes DELETE /profiles/bar to the /destroy action' do
    expect(delete: '/profiles/bar').to route_to(controller: 'profiles', action: 'destroy', id: 'bar')
  end

  it 'routes PUT /profiles/bar to the /update action' do
    expect(put: '/profiles/bar').to route_to(controller: 'profiles', action: 'update', id: 'bar')
  end
end

describe 'routes for Profiles (short form)' do
  it 'routes GET /profiles to the profiles /index page' do
    expect(get('/profiles')).to \
      route_to('profiles#index')
  end

  it 'routes GET /profiles/bar to the /show action' do
    expect(get('/profiles/bar')).to \
      route_to('profiles#show', id: 'bar')
  end

  it 'routes GET /profiles/bar/edit to the /edit action' do
    expect(get('/profiles/bar/edit')).to \
      route_to('profiles#edit', id: 'bar')
  end

  it 'routes GET /profiles/new to the /new action' do
    expect(get('/profiles/new')).to \
      route_to('profiles#new')
  end

  it 'routes POST /profiles/ to the /create action' do
    expect(post('/profiles')).to \
      route_to('profiles#create')
  end

  it 'routes DELETE /profiles/bar to the /destroy action' do
    expect(delete('/profiles/bar')).to \
      route_to('profiles#destroy', id: 'bar')
  end

  it 'routes PUT /profiles/bar to the /update action' do
    expect(put('/profiles/bar')).to \
      route_to('profiles#update', id: 'bar')
  end
end

describe 'named routes for Profiles (long form)' do
  before(:each) do
    @member = Member.create(email: 'foo@bar.com',
                            password: 'bar',
                            password_confirmation: 'bar')
    @profile = @member.build_profile(firstname: 'Foo', lastname: 'Bar')
    @profile.save
  end

  it 'routes GET profile_path to the /index action' do
    # p @member.profile.url
    # p profile_path(@profile)
    expect(get: profiles_path).to route_to(controller: 'profiles', action: 'index')
  end

  it 'routes GET profile_path(@profile) to the /show action' do
    expect(get: profile_path(@profile)).to route_to(controller: 'profiles', action: 'show', id: 'bar')
  end

  it 'routes GET edit_profile_path(@profile) to the /edit action' do
    expect(get: edit_profile_path(@profile)).to route_to(controller: 'profiles', action: 'edit', id: 'bar')
  end

  it 'routes GET new_profile_path to the /new action' do
    # p new_profile_path
    expect(get: new_profile_path).to route_to(controller: 'profiles', action: 'new')
  end

  it 'routes POST profiles_path to the /create action' do
    expect(post: profiles_path).to route_to(controller: 'profiles', action: 'create')
  end

  it 'routes DELETE profile_path(@profile) to the /destroy action' do
    expect(delete: profile_path(@profile)).to route_to(controller: 'profiles', action: 'destroy', id: 'bar')
  end

  it 'routes PUT profile_path(@profile) to the /update action' do
    expect(put: profile_path(@profile)).to route_to(controller: 'profiles', action: 'update', id: 'bar')
  end
end

describe 'some false positive routes' do
  before(:each) do
    @member = Member.create(email: 'foo@bar.com',
                            password: 'bar',
                            password_confirmation: 'bar')
    @profile = @member.build_profile(firstname: 'Foo', lastname: 'Bar')
    @profile.save
  end

  it 'FALSELY routes GET profile_path(@profile) to the /show action' do
    expect(get: profile_path(@profile)).to \
      route_to(controller: 'profiles', action: 'show', id: 'bar')
  end

  it 'CORRECTLY FAILS to route GET profile_path(@profile) to the /show action' do
    expect(get: profile_path(@profile)).to \
      route_to(controller: 'profiles', action: 'show', id: 'bar')
  end

  it 'CORRECTLY FAILS to route GET profile_path(@profile) to the /show action without :id' do
    expect(get: profile_path(@profile))
      .not_to route_to(controller: 'profiles', action: 'show')
  end
end
