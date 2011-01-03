Feature: User logs on

  A user needs to log on for various reasons, such as editing current
  projects, and adding new projects.

  Scenario: User logs on
    Given user is on sign_in page
    When the user signs in
    Then the user is taken to home page
  

