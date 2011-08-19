
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
  p.name        "Project test"
  p.summary     "Test example"
  p.description "Some short, descriptive text for testing."
  p.client      "RSpec"
  p.tags        "TDD, BDD"
  p.startdate   DateTime.new
  p.finishdate  DateTime.new
  p.url         'project-test'
end


Factory.sequence :email do |n|
  "person-#{n}@example.com"
end


Factory.define :profile do |p|
  p.firstname "First"
  p.lastname  "Last"
  p.website   "http://mywebsite.com/"
end

=begin
Factory.define :user do |user|
  user.name                  { |n| "user-#{n}"}
  user.email                 { |n| "user-#{n}@example.com"}
  user.password              { |n| "foobar-#{n}"}
  user.password_confirmation { |n| "foobar-#{n}"}
end
=end