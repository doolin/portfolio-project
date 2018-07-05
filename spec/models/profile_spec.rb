# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Profile do
  let(:member) { create :member }
  let(:attr) do
    { # attributes_for :profile
      firstname: 'Joe',
      lastname: 'Bloggs',
      member: member,
      created_at: 1.day.ago
    }
  end

  subject(:profile) { Profile.new attr }

  it 'creates a new profile given valid attributes' do
    expect(profile).to be_valid
  end

  context 'validations' do
    it 'requires a member id' do
      attr[:member] = nil
      expect(profile).not_to be_valid
    end

    it 'requires nonblank firstname' do
      attr[:firstname] = ''
      expect(profile).not_to be_valid
    end

    it 'requires nonblank lastname' do
      attr[:lastname] = ''
      expect(profile).not_to be_valid
    end

    # http://intridea.com/2009/2/18/quick-tip-url-validation-in-rails?blog=company
    it 'validates any given urls' do
      attr.merge(website: 'http://foobar.com/')
      expect(profile).to be_valid
    end

    it 'validates any given urls without http' do
      attr.merge(website: 'foobar.com/')
      expect(profile).to be_valid
    end

    # Split the protocol validation from the validation for the remaining URL.
    xit 'does not validate url with bogus protocol' do
      attr.merge(website: 'httt://foobar.com/')
      expect(profile).not_to be_valid
    end

    xit 'does not validate url with bogus domain' do
      attr.merge(website: 'http://foobar/')
      expect(profile).not_to be_valid
    end
  end
end
