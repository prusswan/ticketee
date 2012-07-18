Feature: Editing Projects
  In order to update project information
  As a user
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    # And I am signed in as them
    And I am signed in as "admin@ticketee.com"
    Given there is a project called "TextMate 2"
    And I am on the homepage
    # When I follow "TextMate 2"
    # And I follow "Edit Project"

  Scenario: Updating a project
    # And I fill in "Name" with "TextMate 2 beta"
    # And I press "Update Project"
    And I rename the "TextMate 2" project to "TextMate 2 beta"
    # Then I should see "Project has been updated."
    Then I should be informed that the project has been updated
    And I should be on the project page for "TextMate 2 beta"

  Scenario: Updating a project with invalid attributes is bad
    # And I fill in "Name" with ""
    # And I press "Update Project"
    And I rename the "TextMate 2" project to ""
    # Then I should see "Project has not been updated."
    Then I should be informed that the project has not been updated
