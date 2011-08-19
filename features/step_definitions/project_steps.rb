

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
