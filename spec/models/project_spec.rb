require 'spec_helper'

describe Project do
  before(:each) do
    @member = FactoryGirl.create(:member)
    @attr = {
      :name        => 'Foo project',
      :summary     => 'We did it again.',
      :client      => 'Dave D',
      :description => 'A short description for testing.',
      :startdate   => DateTime.new(2010),
      :finishdate  => DateTime.new(2011),
      :tags        => 'foobar'
    }
  end

  it 'should create a new instance given valid attributes' do
    @member.projects.create!(@attr)
    expect(@member.projects.first).to be_valid
  end

  describe 'member associations' do
    before(:each) do
      @project = @member.projects.create(@attr)
    end

    it 'should have a member attribute' do
      expect(@project).to respond_to(:member)
    end

    it 'should have the correct associated member' do
      expect(@project.member).to eq @member
    end
  end


  # I don't like how these validations are structured. They
  # can't be used for outside-in testing; it's possible to
  # write one such that both conditions pass even when the
  # validation isn't specified in the model. Keep an eye out
  # for a better way to test validations.
  describe 'validations' do
    it 'should require a member id' do
      expect(Project.new(@attr)).not_to be_valid
    end

    it 'should require nonblank Summary' do
      expect(@member.projects.build(@attr.merge(:summary =>' '))).not_to be_valid
    end

    it 'should reject long Summary' do
      expect(@member.projects.build(@attr.merge(:summary => 'a' * 501))).not_to be_valid
    end

    it 'should require nonblank Name' do
      expect(@member.projects.build(@attr.merge(:name =>' '))).not_to be_valid
    end

    it 'should accept short Name' do
      expect(@member.projects.build(@attr.merge(:name => 'a' * 125))).to be_valid
    end

    it 'should reject long Name' do
      expect(@member.projects.build(@attr.merge(:name => 'a' * 141))).not_to be_valid
    end

    it 'should accept blank Description' do
      expect(@member.projects.build(@attr.merge(:description =>''))).to be_valid
    end

    it 'should reject long Description' do
      expect(@member.projects.build(@attr.merge(:description => 'a' * 2501))).not_to be_valid
    end

    it 'should require nonblank Start date' do
      expect(@member.projects.build(@attr.merge(:startdate =>' '))).not_to be_valid
    end

    it 'should require nonblank Finish date' do
      expect(@member.projects.build(@attr.merge(:finishdate =>' '))).not_to be_valid
    end

    it 'start date should be less than finish date' do
      @project = @member.projects.create(@attr)
      expect(@project.startdate).to be < @project.finishdate
    end

    it 'start date should not be greater than finish date' do
      @project = @member.projects.create(@attr)
      expect(@project.startdate).not_to be > @project.finishdate
    end

    it 'finish date should raise error' do
      @project = @member.projects.create(@attr)
      @project.finishdate=(DateTime.new(1999))
      expect {
        @project.save!
      }.to raise_error(ActiveRecord::RecordNotSaved)
    end

    # False positive. Where did these tests come from?
    it 'should reject long Client' do
      expect(@member.projects.build(:client => 'a' * 138)).not_to be_valid
    end

    it 'should reject long Client' do
      expect(@member.projects.build(:client => 'a' * 141)).not_to be_valid
    end

  end


  describe 'accessible attributes' do

    # http://guides.rubyonrails.org/association_basics.html#has_many-association-reference
    # This is also a false positive against saving the :uri when it's
    # not given in attr_accessible...
    # TODO: This doesn't smell very good, needs more work.
    it 'should save URI attribute' do
      expect(@member.projects.create(@attr.merge({:uri => 'http://foobar.com/'}))).to be_valid
      #puts @member.projects.to_s
      # This is the smelly part...
      @project = @member.projects.first
      expect(@project.uri).to match(/http:\/\/foobar.com\//)
    end
  end

=begin

From the RSpec-users list Shlomi Zadok

Do this instead:

group :development, :test do
  gem 'rspec-rails', '2.5.0'
end

group :test do
  gem 'webrat', '0.7.1'
end

rspec-rails needs to be in the development env in order to expose
the rake tasks and the test environment in order to be loaded when
you run the spec suite. It has a dependency on rspec, so you don't
need to list rspec explicitly.

Webrat only needs to be in the development env.

HTH,
David
=end
end
