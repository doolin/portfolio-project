Feature: Visitor browses Portfolio Project web site

  The home page of a web site has a number of so-called
  "required" links to pages such as privacy policy, terms
  and conditions, etc. We want to ensure all of these pages
  are easily accessible from links on the home page. It is
  not necessary to be logged in to view these pages.
  
  Scenario: Visitor examines privacy policy
    Given the visitor is on the home page
    And the visitor click the "Privacy Policy" link
    Then the visitor should see the Privacy Policy web page
