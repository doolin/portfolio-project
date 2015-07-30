require_relative '../test_helper'

class ProfileTest < ActiveSupport::TestCase
  setup do
    @member = FactoryGirl.create(:member)
    @attr = {
      firstname: 'Joe',
      lastname: 'Bloggs',
      created_at: 1.day.ago
    }
  end

  test 'should create a new profile given valid attributes' do
    @p1 = FactoryGirl.create(:profile, member: @member, created_at: 1.day.ago)
    assert @p1.valid?
    assert @member.profile.valid?
  end

  test 'should require a member id' do
    refute  Profile.new(@attr).valid?
  end

  test 'should require nonblank firstname' do
    refute @member.build_profile(@attr.merge(firstname: ' ')).valid?
  end

  test 'should require nonblank lastname' do
    refute @member.build_profile(@attr.merge(lastname: ' ')).valid?
  end

  test 'should validate any given urls' do
    assert @member.build_profile(@attr.merge(website: 'http://foobar.com/')).valid?
  end

  test 'should validate any given urls without http' do
    assert @member.build_profile(@attr.merge(website: 'foobar.com/')).valid?
  end

  test 'should not validate url with bogus protocol' do
    skip
    refute @member.build_profile(@attr.merge(website: 'httt://foobar.com/')).valid?
  end

  test 'should not validate url with bogus domain' do
    skip
    refute @member.build_profile(@attr.merge(website: 'http://foobar/')).valid?
  end
end
