Feature: Member logs on

  A member needs to log on for various reasons, such as editing current
  projects, and adding new projects.

  Scenario: Member signs in successfully with email
    Given member is not logged in
    And member name is "foo" with email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    And I should be signed in
    Then I should see "My Projects"

  @wip
  Scenario: Member saves sesssion information as rememberable
    Given member is signed in
    Then member signs out
    When member returns next time
    Then member should be already signed in

  Scenario: Reader who is not a member cannot sign in
    Given member is not logged in
    And no user exists with an email of "user@test.com"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    Then I should see "Invalid email or password."
    And I go to the home page
    And I should be signed out

  Scenario: Member enters wrong password
    Given member is not logged in
    And member name is "foo" with email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/wrongpassword"
    Then I should see "Invalid email or password."
    Then I should see "Sign up"
    And I go to the home page
    And I should be signed out

  Scenario: New member signs up
    Given a site visitor who is not a member
    When the visitor is on the sign up page
    And fills in the sign up form
    And presses the "Sign up" button
    #Then show me the page
    Then the new member should be on the new Profile page
