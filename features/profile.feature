Feature: Member creates profile

  Profiles provide more background information for users.

  Scenario: Member creates a new profile
    Given member is signed in
    And is on the Create Profile page
    When the member fills out all the profile fields correctly
    And the member presses the "Create Profile" button
    Then the member is shown the page for the new profile