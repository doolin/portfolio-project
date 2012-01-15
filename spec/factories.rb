
# By using the symbol ':member', we get Factory Girl to simulate the Member model.
# This is from the Rails Tutorial Listing 7.16
Factory.define :member do |m|
  m.membername            "Dave Doolin"
  m.email                 "david.doolin+3@example.com"
  m.password              "foobar"
  m.password_confirmation "foobar"
  m.firstname             "Dave"
  m.lastname              "Doolin"
end
# These atts were moved to Profile
#  member.firstname             "First"
#  member.lastname              "Last"
#end

Factory.define :project do |p|
  p.name           "Project test"
  p.summary        "Test example"
  p.description    "Some short, descriptive text for testing."
  p.requiredskills "Cat herding"
  p.client         "RSpec"
  p.tags           "TDD, BDD"
  p.startdate       DateTime.new
  p.finishdate      DateTime.new
  p.url            'project-test'
  p.uri            'http://example.com/uri'
end


Factory.sequence :email do |n|
  "person-#{n}@example.com"
end


Factory.define :profile do |p|
  p.firstname    "Dave"
  p.lastname     "Doolin"
  p.website      "http://ridingrails.net/"
  p.twitter      "http://twitter.com/#!/doolin"
  p.facebook     "http://facebook.com/daviddoolin"
  p.linkedin     "http://www.linkedin.com/in/davidmdoolin"
  p.gprofile_url "https://plus.google.com/u/0/109975361919530850213"
end

=begin
Factory.define :user do |user|
  user.name                  { |n| "user-#{n}"}
  user.email                 { |n| "user-#{n}@example.com"}
  user.password              { |n| "foobar-#{n}"}
  user.password_confirmation { |n| "foobar-#{n}"}
end
=end