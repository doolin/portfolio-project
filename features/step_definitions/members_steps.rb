

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
  Member.new(:membername => name,
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
            :password_confirmation => password,
            :firstname => 'MFoo',
            :lastname => 'MBar').save!
  Given %{member is not logged in}
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
  #Then %{I should be signed in}
end

Given /^is on the Create Profile page$/ do
  visit new_profile_path
  #puts new_profile_path
end

When /^the member fills out all the profile fields correctly$/ do
  firstname = "Foo"
  lastname = "Bar"
  And %{I fill in "Firstname" with "#{firstname}"}
  And %{I fill in "Lastname" with "#{lastname}"}
end

When /^the member presses the "([^"]*)" button$/ do |button|
  click_button(button)
end

Then /^the member is shown the page for the new profile$/ do
  # Fixme: the url needs to be extracted from the data
  visit ('bar')
end

Given /^is on the create project page$/ do
  visit new_project_path
end


# Date and time gem: https://gist.github.com/558786
When /^the member fills out all the project fields correctly$/ do
  name = "New project"
  #startdate = "2011-07-16"
  #finishdate = "2011-02-03 00:00:00.000000"
  summary = "New project summary"
  description = "New project description"
  And %{I fill in "Name" with "#{name}"}
  And %{I fill in "Summary" with "#{summary}"}
  And %{I fill in "Description" with "#{description}"}

  # Time and date fields are broken in Capybara, or
  # perhaps it's more accurate to say that Rails doesn't
  # implement something easily used for matching. Also,
  # HTML 5 is coming with it's own date/time form element.
  # Widespread adoption may be a few years in the future.
  # For now, getting the project to work correctly requires
  # removing the presence requirement of dates.
  #select(value, :from => field)
  #select_date("July 16, 2011", :from => 'Startdate')
  #And %{I select "#{startdate}" from "Startdate"}
  #And %{I select #{finishdate} from "Finishdate"}
end

Then /^the member is shown the page for the new project$/ do
  # Fixme: the url needs to be extracted from the data
  visit ('new-project')
end


Given /^a site visitor who is not a member$/ do
  visit('/members/sign_out') # ensure that at least
end

When /^the visitor is on the sign up page$/ do
  visit '/members/sign_up'
end

When /^fills in the sign up form$/ do
  membername = "foobar"
  email = "foo@bar.com"
  password = "testem"
  And %{I fill in "Membername" with "#{membername}"}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I fill in "Password confirmation" with "#{password}"}
end

When /^presses the "([^"]*)" button$/ do |button|
  click_button(button)
end

Then /^the new member should be on the new Profile page$/ do
  And %{I should see "New profile"}
end

