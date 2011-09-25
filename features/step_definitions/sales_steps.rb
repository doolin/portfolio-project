
Given /^the visitor is on the home page$/ do
  visit root_path
end

Given /^the visitor clicks "([^"]*)"$/ do |page_name|
  visit path_to(page_name)
end

Then /^the visitor should see the privacy policy web page$/ do
  page.should have_css('div#privacy-policy')
end
