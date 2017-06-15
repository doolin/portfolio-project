Feature: Visitor browses Portfolio Project web site

  The home page of a web site has a number of so-called
  "required" links to pages such as privacy policy, terms
  and conditions, etc. We want to ensure all of these pages
  are easily accessible from links on the home page. It is
  not necessary to be logged in to view these pages.

  Scenario: Visitor examines privacy policy
    Given the visitor is on the home page
    And the visitor clicks "Privacy"
    Then I should get a response with status "200"
    And the visitor should see the privacy policy web page

  Scenario: Visitor examines newsletter form privacy link
    Given the visitor is on the home page
    And the visitor clicks "We respect your email privacy"
    Then the visitor should see the privacy policy web page

  # This is failing on the submit to AWeber's perl script,
  # the redirect fails routing. Not sure I want to fake it.
  @wip
  Scenario: Visitor signs up for newsletter
    Given the visitor is on the home page
    When the visitor fills in "Name:" with "Dave"
    And fills in "Email:" with "david.doolin@gmail.com"
    And presses "Submit"
    #Then I should be redirected to "/scripts/addlead.pl"
    Then the user is taken to the "/thank-you" page
