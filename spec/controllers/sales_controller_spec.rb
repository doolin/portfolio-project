# frozen_string_literal: true
require 'spec_helper'

describe SalesController do
  describe "GET 'sales/index'" do
    it 'should succeed' do
      member = Member.new id: 1
      # profile = Profile.new id: 1, member_id: member.id, created_at: Time.now.utc
      profile = Profile.new id: 1, member_id: 1, created_at: Time.now.utc
      # expect(Profile).to receive(:find).with(anything).and_return(profile).exactly(4).times
      expect(Profile).to receive(:find).with(1).and_return(profile).exactly(4).times
      get :index
      expect(response).to be_success
    end
  end
end
