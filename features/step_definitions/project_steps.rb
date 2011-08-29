

Given /^a reader is not logged in$/ do
  visit('/members/sign_out')
end

Given /^is on the project page$/ do
  visit projects_path
end

When /^the reader clicks New Project link$/ do
  visit new_project_path
end

Then /^the reader should be on the sign in page$/ do
  Then %{I should be on the sign in page}
end

Given /^is on the member's show page$/ do
  #puts member_root_path
  #visit member_root_path # This is namespaced in routes.rb
  visit member_path
end

When /^the member clicks "([^"]*)"$/ do |link|
  #puts link
  click_link(link)
end

Then /^the member is on the Create Project page$/ do
  visit new_project_path
end
