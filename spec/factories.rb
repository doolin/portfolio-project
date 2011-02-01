
# By using the symbol ':member', we get Factory Girl to simulate the Member model.
# This is from the Rails Tutorial Listing 7.16
Factory.define :member do |member|
  member.membername            "Dave Doolin"
  member.email                 "david.doolinl@example.com"
  member.password              "foobar"
  member.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :project do |p|
  p.name "Project test"
  p.summary  "Test example"
  p.client  "RSpec"
  p.tags  "TDD, BDD"
end
