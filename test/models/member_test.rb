# frozen_string_literal: true
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
    @member.destroy
    [@p1, @p2].each do |p|
      assert_nil Project.find_by_id(p.id)
    end
  end

  test 'should have a profile' do
    assert_equal @profile, @member.profile
  end

  test 'destroys the associated profile' do
    @member.destroy
    [@profile].each do |p|
      assert_nil Profile.find_by_id(p.id)
    end
  end

  test 'requires first and last name' do
    assert FactoryGirl.create(:member, email: 'foo@bar.com').valid?
    refute FactoryGirl.build(:member, firstname: nil).valid?
    refute FactoryGirl.build(:member, lastname: nil).valid?
  end

  test 'should enforce unique email' do
    m1 = FactoryGirl.create(:member, email: 'bar@foo.com')
    refute FactoryGirl.build(:member, email: m1.email).valid?
  end
end
