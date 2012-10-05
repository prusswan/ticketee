Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    # And I am signed in as them
    And I am signed in as "user@ticketee.com"
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project

  Scenario: Listing all projects
    And I am on the homepage
    # When I follow "TextMate 2"
    When I navigate to the "TextMate 2" project page
    Then I should be on the project page for "TextMate 2"
