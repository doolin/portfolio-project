Feature: User logs on

  A user needs to log on for various reasons, such as editing current
  projects, and adding new projects.

   Scenario: User signs in successfully with email
    Given member is not logged in
    And member name is "foo" with email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    Then I should see "Portfolio Project"
    And I should be signed in
    When I return next time
    Then I should be already signed in

  Scenario: User is not signed up
      Given member is not logged in
      And no user exists with an email of "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out

  Scenario: User enters wrong password
    Given member is not logged in
    And member name is "foo" with email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/wrongpassword"
    Then I should see "Invalid email or password."
    Then I should see "Sign up"
    And I go to the home page
    And I should be signed out
  

