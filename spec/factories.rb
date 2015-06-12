=begin
Factory.define :member do |m|
  m.membername            "Dave Doolin"
  m.email                 "david.doolin+3@example.com"
  m.password              "foobar"
  m.password_confirmation "foobar"
  m.firstname             "Dave"
  m.lastname              "Doolin"
end
=end

FactoryGirl.define do # :member do |m|
  factory :member do
    membername            'Dave Doolin'
    email                 'david.doolin+3@example.com'
    password              'foobar'
    password_confirmation 'foobar'
    firstname             'Dave'
    lastname              'Doolin'
  end

  factory :project do
    name           'Project test'
    summary        'Test example'
    description    'Some short, descriptive text for testing.'
    requiredskills 'Cat herding'
    client         'RSpec'
    tags           'TDD, BDD'
    startdate       Time.now
    finishdate      Time.now
    url            'project-test'
    uri            'http://example.com/uri'
  end

  factory :profile do
    firstname    'Dave'
    lastname     'Doolin'
    website      'http://ridingrails.net/'
    twitter      'http://twitter.com/#!/doolin'
    facebook     'http://facebook.com/daviddoolin'
    linkedin     'http://www.linkedin.com/in/davidmdoolin'
    gprofile_url 'https://plus.google.com/u/0/109975361919530850213'
  end

  sequence :email do |n|
    "person-#{n}@example.com"
  end
end
