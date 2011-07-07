

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