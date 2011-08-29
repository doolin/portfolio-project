Feature: Member creates project

  Projects are the lynchpin of the application, and each
  member needs to be able to accurately and quickly create
  new projects.

  Scenario: Member creates a new project
    Given member is signed in as "user@test.com" and password "please"
    And is on the create project page
    When the member fills out all the project fields correctly
    And the member presses the "Create Project" button
    Then the member is shown the page for the new project

  Scenario: Guest reader is directed to signup page
    Given a reader is not logged in
    And is on the project page
    When the reader clicks New Project link
    Then the reader should be on the sign in page

  Scenario: Member creates new project from member's page
    Given member is signed in as "user@test.com" and password "please"
    #And is on the member's show page # TODO: get rid of the juju here
    When the member clicks "New Project"
    Then the member is on the Create Project page
