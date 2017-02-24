# frozen_string_literal: true
require 'spec_helper'

describe Profile do
  let(:member) { create :member }
  let(:attr) { {
      firstname: 'Joe',
      lastname: 'Bloggs',
      created_at: 1.day.ago
    }
  }

  it 'creates a new profile given valid attributes' do
    p1 = create(:profile, member: member, created_at: 1.day.ago)
    expect(p1).to be_valid
    expect(member.profile).to be_valid
  end

  describe 'Validations' do
    it 'requires a member id' do
      expect(Profile.new(attr)).not_to be_valid
    end

    it 'requires nonblank firstname' do
      expect(member.build_profile(attr.merge(firstname: ' '))).not_to be_valid
    end

    it 'requires nonblank lastname' do
      expect(member.build_profile(attr.merge(lastname: ' '))).not_to be_valid
    end

    # http://intridea.com/2009/2/18/quick-tip-url-validation-in-rails?blog=company
    it 'validates any given urls' do
      expect(member.build_profile(attr.merge(website: 'http://foobar.com/'))).to be_valid
    end

    it 'validates any given urls without http' do
      expect(member.build_profile(attr.merge(website: 'foobar.com/'))).to be_valid
    end

    # Split the protocol validation from the validation for the remaining URL.
    xit 'does not validate url with bogus protocol' do
      expect(member.build_profile(attr.merge(website: 'httt://foobar.com/'))).not_to be_valid
    end

    xit 'does not validate url with bogus domain' do
      expect(member.build_profile(attr.merge(website: 'http://foobar/'))).not_to be_valid
    end
  end
end
