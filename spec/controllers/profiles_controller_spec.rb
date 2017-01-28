require 'spec_helper'

describe ProfilesController do
  before(:each) do
    @member  = FactoryGirl.create(:member)
    @profile = FactoryGirl.create(:profile, member: @member)
    sign_in @member
  end

  describe "GET 'index'" do
    it 'lists member profiles when signed in' do
      get :index
      expect(response).to render_template('index')
    end

    it 'redirects to sign in path when signed out' do
      sign_out @member
      get :index
      # Changing the behavior, we want the profiles page indexed for SEO.
      # response.should redirect_to(new_member_session_path)
      expect(response).to render_template('index')
    end
  end

  describe "GET 'show'" do
    it 'should be successful' do
      sign_out @member
      get :show, params: { id: @profile.url }
      expect(response).to be_success
    end

    it "displays the member's profile" do
      sign_out @member
      get :show, params: { id: @profile.url }
      expect(response).to render_template('show')
    end
  end

  describe "GET 'new'" do
    it 'renders the new profile page' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET 'edit'" do
    it 'renders the edit profile page' do
      get :edit, params: { id: @profile.url }
      expect(response).to render_template('edit')
    end
  end

  describe "POST 'create'" do
    it 'creates a new profile for signed in member' do
      sign_out @member
      @newmember  = FactoryGirl.create(:member, email: 'foofppf@gmail.com')
      sign_in @newmember
      expect do
        post :create, params: { firstname: 'foo', lastname: 'bar' }
      end.to change(Profile, :count).by(1)
    end

    it 'creates a profile for member without a profile' do
      @member.profile.destroy
      expect do
        post :create, params: { firstname: 'foo', lastname: 'bar' }
      end.to change(Profile, :count).by(1)
    end
  end

  describe "PUT 'update'" do
    xit 'updates the profile for signed in member' do
      member  = FactoryGirl.create(:member, email: 'foo@bar.com')
      member.save!
      profile = FactoryGirl.create(:profile, member: member)
      # profile.save!
      # profile.reload
      # put :update, :id => @profile.url, :profile => { :firstname => 'Foo', :lastname => 'Bar' }
      ap profile
      # The controller updates the id as it's in the permitted parameters, hence isn't the same object
      # once the associated member is saved. There is a still a problem where the profile
      # attributes are not updating.
      put :update, params: { id: profile.url, firstname: 'Foo', lastname: 'Bar'  }
      binding.pry
      profile.reload
      expect(response).to redirect_to(profile_path(profile))
      expect(@profile.firstname).to eq('Foo')
      expect(@profile.lastname).to eq('Bar')
    end

    it 'updates the profile for nil website' do
      # The parameter structure here is probably bad, which would be why the
      # update query won't resolve permitted parameters.
      put :update, params: { id: @profile.url, profile: { firstname: 'Foo', lastname: 'Bar', website: nil } }
      # binding.pry
      @profile.reload
      expect(response).to redirect_to(profile_path(@profile))
      expect(@profile.website).to match('')
    end
  end

  describe "DELETE 'destroy'" do
    it 'should destroy the profile' do
      expect do
        delete :destroy, params: { id: @profile.url }
      end.to change(Profile, :count).by(-1)
    end

    it 'redirects to the projects list' do
      delete :destroy, params: { id: @profile.url }
      expect(response).to redirect_to(root_path)
    end
  end
end
