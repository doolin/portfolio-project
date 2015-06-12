require 'spec_helper'

describe Member do
  describe 'project associations' do
    before(:each) do
      @member = FactoryGirl.create(:member)
      @p1 = FactoryGirl.create(:project, :member => @member, :created_at => 1.day.ago)
      @p2 = FactoryGirl.create(:project, :member => @member, :created_at => 1.hour.ago)
    end

    it 'should have a projects attribute' do
      expect(@member).to respond_to(:projects)
    end

    it 'should have the right projects in the right order' do
      expect(@member.projects).to eq [@p2, @p1]
    end

    it 'should destroy associated projects' do
      @member.destroy
      [@p1, @p2].each do |p|
        expect(Project.find_by_id(p.id)).to be_nil
      end
    end
  end

  describe 'profile associations' do
    before(:each) do
      @member = FactoryGirl.create(:member)
      @p1 = FactoryGirl.create(:profile, :member => @member, :created_at => 1.day.ago)
    end

    it 'should have a profile' do
      expect(@member.profile).to eq @p1
    end

    it 'destroys the associated profile' do
      @member.destroy
      [@p1].each do |p|
        expect(Profile.find_by_id(p.id)).to be_nil
      end
    end
  end

  describe 'saving' do
    it 'requires first and last name' do
      expect(FactoryGirl.create(:member)).to be_valid
      expect(FactoryGirl.build(:member, :firstname => nil)).not_to be_valid
      expect(FactoryGirl.build(:member, :lastname => nil)).not_to be_valid
    end

    it 'should enforce unique email' do
      m1 = FactoryGirl.create(:member)
      expect(FactoryGirl.build(:member, :email => m1.email)).not_to be_valid
    end
  end
end
