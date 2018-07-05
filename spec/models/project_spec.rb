# frozen_string_literal: true

require 'spec_helper'

describe Project do
  let(:member) { create :member }
  let(:attrs) do
    {
      name: 'Foo project',
      summary: 'We did it again.',
      client: 'Dave D',
      description: 'A short description for testing.',
      startdate: Time.utc(2010),
      finishdate: Time.utc(2011),
      member_id: member.id,
      tags: 'foobar'
    }
  end

  it 'valid attributes are indeed valid' do
    expect(Project.new(attrs)).to be_valid
  end

  context 'member associations' do
    subject(:project) { Project.create!(attrs) }

    it 'has a non-nil member attribute' do
      expect(project).to respond_to(:member)
    end

    it 'has the correct associated member' do
      expect(project.member).to eq member
    end
  end

  # I don't like how these validations are structured. They
  # can't be used for outside-in testing; it's possible to
  # write one such that both conditions pass even when the
  # validation isn't specified in the model. Keep an eye out
  # for a better way to test validations.
  describe 'validations' do
    # subject(:project) { Project.new(attrs) }

    it 'requires nonblank Summary' do
      expect(Project.new(attrs.merge(summary: ' '))).not_to be_valid
      # attrs.merge(summary: ' ')
      # expect(project).not_to be_valid
    end

    it 'rejects long Summary' do
      expect(Project.new(attrs.merge(summary: 'a' * 501))).not_to be_valid
    end

    it 'requires nonblank Name' do
      expect(Project.new(attrs.merge(name: ' '))).not_to be_valid
    end

    it 'accepts short Name' do
      expect(Project.new(attrs.merge(name: 'a' * 125))).to be_valid
    end

    it 'rejects long Name' do
      expect(Project.new(attrs.merge(name: 'a' * 141))).not_to be_valid
    end

    it 'accepts blank Description' do
      expect(Project.new(attrs.merge(description: ''))).to be_valid
    end

    it 'rejects long Description' do
      expect(Project.new(attrs.merge(description: 'a' * 2501))).not_to be_valid
    end

    it 'requires nonblank Start date' do
      expect(Project.new(attrs.merge(startdate: ' '))).not_to be_valid
    end

    it 'requires nonblank Finish date' do
      expect(Project.new(attrs.merge(finishdate: ' '))).not_to be_valid
    end

    it 'start date should be less than finish date' do
      project = Project.create(attrs)
      expect(project.startdate).to be < project.finishdate
    end

    it 'start date should not be greater than finish date' do
      project = Project.create(attrs)
      expect(project.startdate).not_to be > project.finishdate
    end

    it 'finish date should raise error' do
      project = Project.create(attrs)
      project.finishdate = Time.utc(1999)
      expect do
        project.save!
      end.to raise_error(ActiveRecord::RecordNotSaved)
    end

    # False positive. Where did these tests come from?
    it 'rejects long Client' do
      expect(Project.new(client: 'a' * 139)).not_to be_valid
    end

    it 'rejects long Client' do
      expect(Project.new(client: 'a' * 141)).not_to be_valid
    end
  end

  describe 'accessible attributes' do
    # http://guides.rubyonrails.org/association_basics.html#has_many-association-reference
    # This is also a false positive against saving the :uri when it's
    # not given in attr_accessible...
    # TODO: This doesn't smell very good, needs more work.
    it 'saves URI attribute' do
      expect(Project.create(attrs.merge(uri: 'http://foobar.com/'))).to be_valid
      # puts @member.projects.to_s
      # This is the smelly part...
      # @project = member.projects.first
      project = Project.first
      expect(project.uri).to match(%r{http://foobar.com/})
    end
  end
end
