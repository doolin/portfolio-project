# frozen_string_literal: true
require 'spec_helper'

describe Member do
  context 'project associations' do
    let(:member) { create :member }

    before(:each) do
      @p1 = create(:project, member: member, created_at: 1.day.ago)
      @p2 = create(:project, member: member, created_at: 1.hour.ago)
    end

    it ' has a projects attribute' do
      expect(member).to respond_to(:projects)
    end

    it 'has the right projects in the right order' do
      expect(member.projects).to eq [@p2, @p1]
    end

    it 'destroys associated projects' do
      member.destroy
      [@p1, @p2].each do |p|
        expect(Project.find_by(id: p.id)).to be_nil
      end
    end
  end

  context 'profile associations' do
    let(:member) { create :member }

    before(:each) do
      @p1 = create(:profile, member: member, created_at: 1.day.ago)
    end

    it 'has a profile' do
      expect(member.profile).to eq @p1
    end

    it 'destroys the associated profile' do
      member.destroy
      [@p1].each do |p|
        expect(Profile.find_by(id: p.id)).to be_nil
      end
    end
  end

  context 'validations' do
    it 'requires first and last name' do
      expect(create(:member)).to be_valid
      expect(build(:member, firstname: nil)).not_to be_valid
      expect(build(:member, lastname: nil)).not_to be_valid
    end

    it 'enforces unique email' do
      m1 = create :member
      expect(build(:member, email: m1.email)).not_to be_valid
    end
  end
end
