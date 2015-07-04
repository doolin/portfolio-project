require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'paths'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'selectors'))

Given /^a site visitor who is not a member$/ do
  step %{member with email "user@test.com" and password "foobar"}
  visit('/members/sign_out')
end

Given /^member with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  @member = Member.create(
    email: email,
    password: password,
    password_confirmation: password,
    firstname: 'foo',
    lastname: 'bar')
  @profile = @member.build_profile(firstname: 'Foo', lastname: 'bar')
  @profile.save
end

When /^fills in the Sign Up Free form$/ do
  email = 'foo@bar.com'
  password = 'testem'
  step %{I fill in "member_email" with "#{email}"}
  step %{I fill in "member_password" with "#{password}"}
end

When /^fills in the sign up form$/ do
  email = 'foo@bar.com'
  password = 'testem'
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
end

Given /^member name is "([^"]*)" with email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  @member = Member.create(membername: name,
             email: email,
             password: password,
             password_confirmation: password,
             firstname: 'foo',
             lastname: 'bar') #.save!
  @profile = @member.build_profile(firstname: 'Foo', lastname: 'bar')
  @profile.save
end

Given /^no user exists with an email of "(.*)"$/ do |email|
  Member.find(:first, conditions: { email: email }).should be_nil
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
  step %{member is not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
end

When /^the user signs in$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the user is taken to home page$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^member is not logged in$/ do
  step %{member name is "foo" with email "foo@test.com" and password "please"}
  visit('/members/sign_out') # ensure that at least
end

Then /^I should be signed in$/ do
  step %{I should see "Sign out"}
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
  step %{I should see "Sign up"}
  step %{I should see "Sign in"}
  step %{I should not see "Logout"}
end

#########  Project and profile

Given /^member is signed in as "([^"]*)" and password "([^"]*)"$/ do |email, password|
  name = 'foobar'
  # Member.new may not work
  @member = Member.new(membername: name,
            email: email,
            password: password,
            password_confirmation: password,
            firstname: 'MFoo',
            lastname: 'MBar') #.save!

  @member.save!
  #puts @member.member_id
  @profile = @member.build_profile(firstname: 'Foo', lastname: 'bar')
  #puts @profile.inspect # Also, p object is an alias for puts object.inspect
  @profile.save
  #Given %{member is not logged in}
  step %{member is not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
  #Then %{I should be signed in}
end

Given /^is on the Create Profile page$/ do
  visit new_profile_path
  #puts new_profile_path
end

When /^the member fills out all the profile fields correctly$/ do
  firstname = 'Foo'
  lastname = 'Bar'
  step %{I fill in "Firstname" with "#{firstname}"}
  step %{I fill in "Lastname" with "#{lastname}"}
end

When /^the member presses the "([^"]*)" button$/ do |button|
  click_button(button)
end

Then /^the member is shown the page for the new profile$/ do
  # FIXME: the url needs to be extracted from the data
  visit('bar')
end

Given /^is on the create project page$/ do
  visit new_project_path
end

# Date and time gem: https://gist.github.com/558786
When /^the member fills out all the project fields correctly$/ do
  name = 'New project'
  startdate = '2011-07-16'
  finishdate = '2011-08-03'
  summary = 'New project summary'
  description = 'New project description'
  tags = 'tag1, tag2'
  step %{I fill in "Name" with "#{name}"}
  step %{I fill in "Summary" with "#{summary}"}
  step %{I fill in "Description" with "#{description}"}
  step %{I fill in "Tags" with "#{tags}"}

  # Time and date fields are broken in Capybara, or
  # perhaps it's more accurate to say that Rails doesn't
  # implement something easily used for matching. Also,
  # HTML 5 is coming with it's own date/time form element.
  # Widespread adoption may be a few years in the future.
  # For now, getting the project to work correctly requires
  # removing the presence requirement of dates.
  # Note that webrat select_date and cucumber select_date
  # have different parameters. Not sure about Capybara,
  # might be worth checking.
  #select(value, :from => field)
  #select_date("July 16, 2011", :from => 'Starting date')
  #select_date("July 16, 2011", :from => 'jksfglkadhg Starting date')
  #select_date("July 16, 2011", :with => 'project_startdate')
  #select_date("2011-07-16")
  select_date('Startdate', with: startdate)
  select_date('Finishdate', with: finishdate)
  #select_date("July 16, 2011")
  #select_date('2011-07-16 00:00:00', :from => 'Starting date')
  #And %{I select "#{startdate}" from "Startdate"}
  #And %{I select #{finishdate} from "Finishdate"}
end

Then /^the member is shown the page for the new project$/ do
  # FIXME: the url needs to be extracted from the data
  step %{member name is "foo" with email "user@test.com" and password "foobar"}
  visit('new-project')
end

When /^the visitor is on the sign up page$/ do
  visit '/members/sign_up'
end

When /^presses the "([^"]*)" button$/ do |button|
  click_button(button)
end

Then /^the new member should be on the new Profile page$/ do
  step %{I should see "New profile"}
end

Given /^member is logged in$/ do
  #=begin
  email = 'testing@man.net'
  password = 'secretpass'
  #Member.new(:email => email, :password => password, :password_confirmation => password).save!
  Member.new(email: email,
                password: password,
                password_confirmation: password,
                firstname: 'Foo',
                lastname: 'Bar').save!

  visit '/members/sign_in'
  within('#member_new') do
    fill_in 'member_email', with: email
    fill_in 'member_password', with: password
  end
  click_button 'Sign in'
  #visit('/members/sign_out')
  #=end
end

When /^the member changes email and password$/ do
  #=begin
  email = 'testing2@man.net'
  password = 'secretpass'
  #Member.new(:email => email, :password => password, :password_confirmation => password).save!
  Member.new(email: email,
                password: password,
                password_confirmation: password,
                firstname: 'Foo',
                lastname: 'Bar').save!
  #=end

  password = 'secretpass'
  visit '/members/edit'
  fill_in 'member_password', with: password
  fill_in 'member_password_confirmation', with: password
  fill_in 'member_current_password', with: password
  click_button 'Update'
end

Then /^the member should see "([^"]*)"$/ do |_arg1|
  page.should have_content('Projects')
end
