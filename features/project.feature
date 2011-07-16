Feature: Member creates a new project

  Projects are the lynchpin of the application, and each
  member needs to be able to accurately and quickly create
  new projects.

  Scenario: Member creates a new project
    Given member is signed in
    And is on the create project page
    When the member fills out all the project fields correctly
    And the member presses the "Create Project" button
    Then the member is shown the page for the new project