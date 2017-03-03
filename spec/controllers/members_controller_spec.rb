# frozen_string_literal: true
require 'spec_helper'

describe MembersController do
  let(:member) { create :member }

  describe "GET 'show'" do
    it "should show the member's projects'" do
      create :project, member: member, summary: 'Foo bar'
      create :project, member: member, summary: 'Baz quux'
      get :show, params: { id: member }
      expect(response).to render_template('show')
    end
  end

  describe "GET 'index'" do
    it 'signed in should list member profiles' do
      sign_in member
      get :index
      expect(response).to redirect_to(profiles_path)
    end

    it 'signed out should redirect to sign in path' do
      sign_out member
      get :index
      expect(response).to redirect_to(new_member_session_path)
    end
  end
end
