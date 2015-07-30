require_relative '../test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @member = FactoryGirl.create(:member)
    @attr = {
      name: 'Foo project',
      summary: 'We did it again.',
      client: 'Dave D',
      description: 'A short description for testing.',
      startdate: DateTime.new(2010),
      finishdate: DateTime.new(2011),
      tags: 'foobar'
    }
  end

  test 'should create a new instance given valid attributes' do
    @member.projects.create!(@attr)
    assert @member.projects.first.valid?
  end

  setup do
    @project = @member.projects.create(@attr)
  end

  test 'should have a member attribute' do
    assert_respond_to(@project, :member)
  end

  test 'should have the correct associated member' do
    assert_equal @project.member, @member
  end

  test 'should require a member id' do
    refute Project.new(@attr).valid?
  end

  test 'should require nonblank Summary' do
    refute @member.projects.build(@attr.merge(summary: ' ')).valid?
  end

  test 'should reject long Summary' do
    refute @member.projects.build(@attr.merge(summary: 'a' * 501)).valid?
  end

  test 'should require nonblank Name' do
    refute @member.projects.build(@attr.merge(name: ' ')).valid?
  end

  test 'should accept short Name' do
    skip
    refute @member.projects.build(@attr.merge(name: 'a' * 125)).valid?
  end

  test 'should reject long Name' do
    refute @member.projects.build(@attr.merge(name: 'a' * 141)).valid?
  end

  test 'should accept blank Description' do
    assert @member.projects.build(@attr.merge(description: '')).valid?
  end

  test 'should reject long Description' do
    refute @member.projects.build(@attr.merge(description: 'a' * 2501)).valid?
  end

  test 'should require nonblank Start date' do
    refute @member.projects.build(@attr.merge(startdate: ' ')).valid?
  end

  test 'should require nonblank Finish date' do
    refute @member.projects.build(@attr.merge(finishdate: ' ')).valid?
  end

  test 'start date should be less than finish date' do
    @project = @member.projects.create(@attr)
    assert_equal true, @project.startdate < @project.finishdate
  end

  test 'start date should not be greater than finish date' do
    @project = @member.projects.create(@attr)
    refute @project.startdate > @project.finishdate
  end

  test 'finish date should raise error' do
    skip
    @project = @member.projects.create(@attr)
    @project.finishdate = (DateTime.new(1999))
    expect do
      @project.save!
    end.to raise_error(ActiveRecord::RecordNotSaved)
  end

  # False positive. Where did these tests come from?
  test 'should reject long Client' do
    refute @member.projects.build(client: 'a' * 138).valid?
  end

  test 'should reject long Client version 2' do
    refute @member.projects.build(client: 'a' * 141).valid?
  end

  # http://guides.rubyonrails.org/association_basics.html#has_many-association-reference
  # This is also a false positive against saving the :uri when it's
  # not given in attr_accessible...
  # TODO: This doesn't smell very good, needs more work.
  test 'should save URI attribute' do
    assert @member.projects.create(@attr.merge(uri: 'http://foobar.com/')).valid?
    # puts @member.projects.to_s
    # This is the smelly part...
    @project = @member.projects.first
    assert @project.uri =~ %r{http://foobar.com/}
  end
end
