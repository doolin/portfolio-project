require_relative '../test_helper'

class ProfilesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @member  = FactoryGirl.create(:member)
    @profile = FactoryGirl.create(:profile, member: @member)
    sign_in @member
  end

  test 'lists member profiles when signed in' do
    get :index
    assert_template 'index'
  end

  test 'redirects to sign in path when signed out' do
    sign_out @member
    get :index
    # Changing the behavior, we want the profiles page indexed for SEO.
    # response.should redirect_to(new_member_session_path)
    assert_template 'index'
  end

  test 'should be successful' do
    sign_out @member
    get :show, id: @profile.url
    assert_response :success
  end

  test "displays the member's profile" do
    sign_out @member
    get :show, id: @profile.url
    assert_template 'show'
  end

  test 'renders the new profile page' do
    get :new
    assert_template 'new'
  end

  test 'renders the edit profile page' do
    get :edit, id: @profile.url
    assert_template 'edit'
  end

  test 'creates a new profile for signed in member' do
    skip
    sign_out @member
    @newmember  = FactoryGirl.create(:member, email: 'foofppf@gmail.com')
    sign_in @newmember
    expect do
      post :create, firstname: 'foo', lastname: 'bar'
    end.to change(Profile, :count).by(1)
  end

  test 'creates a profile for member without a profile' do
    skip
    @member.profile.destroy
    expect do
      post :create, firstname: 'foo', lastname: 'bar'
    end.to change(Profile, :count).by(1)
  end

  test 'creates a new profile' do
    skip
    Profile.should_receive(:new).with(firstname: 'foo', lastname: 'bar')
    post :create, firstname: 'foo', lastname: 'bar'
  end

  test 'updates the profile for signed in member' do
    # skip
    member  = FactoryGirl.create(:member, email: 'foo@bar.com')
    # member.save!
    profile = FactoryGirl.create(:profile, member: member)
    # profile.save!
    # put :update, id: profile.url, firstname: 'Foo', lastname: 'Bar'
    put :update, id: profile.id, firstname: 'Foo', lastname: 'Bar'
    profile.reload
    assert_redirect_to profile_path(@profile)
    assert_equal 'Foo', @profile.firstname
    assert_equal 'Bar', @profile.lastname
  end

  test 'updates the profile for nil website' do
    skip
    put :update, id: @profile.url, profile: { firstname: 'Foo', lastname: 'Bar', website: nil }
    @profile.reload
    expect(response).to redirect_to(profile_path(@profile))
    expect(@profile.website).to be_nil
  end

  test 'should destroy the profile' do
    skip
    expect do
      delete :destroy, id: @profile.url
    end.to change(Profile, :count).by(-1)
  end

  test 'redirects to the projects list' do
    delete :destroy, id: @profile.url
    assert_redirected_to root_path
  end
end
