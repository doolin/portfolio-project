

# 
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^no user exists with an email of "(.*)"$/ do |email|
  Member.find(:first, :conditions => { :email => email }).should be_nil
end

#Given /^I am a member named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
Given /^member name is "([^"]*)" with email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  Member.new(:name => name,
            :email => email,
            :password => password,
            :password_confirmation => password).save!
end

Given /^member is on sign_in page$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
  #pending # express the regexp above with the code you wish you had
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  Given %{member is not logged in}
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end

When /^the user signs in$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the user is taken to home page$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^member is not logged in$/ do
  visit('/members/sign_out') # ensure that at least
end

Then /^I should be signed in$/ do
  Then %{I should see "Portfolio Project"}
  And  %{I should see "Sign out"}
  #And  %{I should not see "Sign up"}
end

Then /^I should be already signed in$/ do
  And %{I should see "Sign out"}
end

Then /^I sign out$/ do
  visit('/users/sign_out')
end

When /^I return next time$/ do
  And %{I go to the home page}
end

Then /^I should be signed out$/ do
  And %{I should see "Sign up"}
  And %{I should see "Sign in"}
  And %{I should not see "Logout"}
end


#########  Project and profile


Given /^member is signed as "([^"]*)" and password "([^"]*)"$/ do |email, password|
  name = "foobar"
  @member = Member.new(:name => name,
            :email => email,
            :password => password,
            :password_confirmation => password).save!
  Given %{member is not logged in}
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
  #Then %{I should be signed in}

#  pending # express the regexp above with the code you wish you had
end

Given /^is on the Create Profile page$/ do
  visit new_profile_path
  #puts new_profile_path
end

When /^the member fills out all the profile fields correctly$/ do
  #visit new_profile_path
  firstname = "Foo"
  lastname = "Bar"
  #visit('/profiles/new')
  And %{I fill in "Firstname" with "#{firstname}"}
  And %{I fill in "Lastname" with "#{lastname}"}
  #And %{I press "Sign in"}
  #pending # express the regexp above with the code you wish you had
end

When /^the member presses the "([^"]*)" button$/ do |button|
  click_button(button)
  #click_button(button)
  #pending # express the regexp above with the code you wish you had
end

Then /^the member is shown the page for the new profile$/ do
  visit ('bar')
  #pending # express the regexp above with the code you wish you had
end

Given /^is on the create project page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^the member fills out all the project fields correctly$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the member is shown the page for the new project$/ do
  pending # express the regexp above with the code you wish you had
end



