# TODO: some of these are framework tests and should be replaced.

require_relative '../test_helper'

class MemberTest < ActiveSupport::TestCase
  setup do
    @member = FactoryGirl.create(:member)
    @p1 = FactoryGirl.create(:project, member: @member, created_at: 1.day.ago)
    @p2 = FactoryGirl.create(:project, member: @member, created_at: 1.hour.ago)
    @profile = FactoryGirl.create(:profile, member: @member, created_at: 1.day.ago)
  end

  test 'should have a projects attribute' do
    assert_respond_to(@member, :projects)
  end

  test 'should have the right projects in the right order' do
    assert_equal [@p2, @p1], @member.projects
  end

  test 'should destroy associated projects' do
    skip
    @member.destroy
    [@p1, @p2].each do |p|
      expect(Project.find_by_id(p.id)).to be_nil
    end
  end

  test 'should have a profile' do
    assert_equal @profile, @member.profile
  end

  test 'destroys the associated profile' do
    skip
    @member.destroy
    [@profile].each do |p|
      expect(Profile.find_by_id(p.id)).to be_nil
    end
  end

  test 'requires first and last name' do
    skip
    expect(FactoryGirl.create(:member)).to be_valid
    expect(FactoryGirl.build(:member, firstname: nil)).not_to be_valid
    expect(FactoryGirl.build(:member, lastname: nil)).not_to be_valid
  end

  test 'should enforce unique email' do
    skip
    m1 = FactoryGirl.create(:member)
    expect(FactoryGirl.build(:member, email: m1.email)).not_to be_valid
  end
end
