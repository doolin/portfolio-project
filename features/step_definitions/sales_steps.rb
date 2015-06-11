
Given /^the visitor is on the home page$/ do
  step %{member name is "foo" with email "user@test.com" and password "foobar"}
  visit root_path
end

Given /^the visitor clicks "([^"]*)"$/ do |page_name|
  visit path_to(page_name)
end

Then /^the visitor should see the privacy policy web page$/ do
  page.should have_css('div#privacy-policy')
end

Then /^I should get a response with status "([^"]*)"$/ do |status|
#Then /^I should get a response with status (\d+)$/ do |status|
  page.driver.status_code.should == status.to_i
end



# AWeber form handling...
When /^the visitor fills in "([^"]*)" with "([^"]*)"$/ do |label, value|
  Given %{I fill in "#{label}" with "#{value}"}
end

When /^fills in "([^"]*)" with "([^"]*)"$/ do |label, value|
  Given %{I fill in "#{label}" with "#{value}"}
end

When /^presses "([^"]*)"$/ do |arg1|
  click_button('Submit')
  And %{I dump the response}
end

Then /^I should be redirected to "(.*)"$/ do |url|
  response.should redirect_to(url)
end

Then /^the user is taken to the "([^"]*)" page$/ do |link|
  visit link
end

When /^I dump.* the response$/ do
  puts body
end
