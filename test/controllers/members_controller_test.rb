require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @member = FactoryGirl.create :member
  end

  test "should show the member's projects'" do
    p1 = FactoryGirl.create(:project, member: @member, summary: 'Foo bar')
    p2 = FactoryGirl.create(:project, member: @member, summary: 'Baz quux')
    @member.projects = [p1, p2]
    get :show, id: @member
    assert_template 'show'
  end

  test 'signed in should list member profiles' do
    sign_in @member
    get :index
    assert_redirected_to profiles_path
  end

  test 'signed out should redirect to sign in path' do
    sign_out @member
    get :index
    assert_redirected_to new_member_session_path
  end
end
