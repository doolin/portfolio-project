

Given /^reader is not logged in$/ do
  @member = FactoryGirl.create :member
  profile = FactoryGirl.create :profile, member_id: @member.id

  featured_profiles = [
    Profile.find(profile.id),
    Profile.find(profile.id),
    Profile.find(profile.id),
    Profile.find(profile.id)
  ]

  sales_controller = instance_double("SalesController")

  expect(Profile).to receive(:find).with(anything).and_return(profile).exactly(4).times

  step %(member name is "foo" with email "foo@test.com" and password "please")
  # visit('/members/sign_out')
  visit root_path
end

Given /^is on the project page$/ do
  visit projects_path
end

When /^the reader clicks New Project link$/ do
  visit new_project_path
end

Then /^the reader should be on the sign in page$/ do
  step %(I should be on the sign in page)
end

Given /^is on the member's show page$/ do
  # puts member_root_path
  # visit member_root_path # This is namespaced in routes.rb
  visit member_path(@member)
  # save_and_open_page
end

When /^the member clicks "([^"]*)"$/ do |link|
  # puts link
  click_link(link)
end

Then /^the member is on the Create Project page$/ do
  visit new_project_path
end
