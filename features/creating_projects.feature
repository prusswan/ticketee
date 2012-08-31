Feature: Creating projects
  In order to have projects to assign tickets to
  As a user
  I want to create them easily

  Background:
    Given I am on the homepage
    # When I follow "New Project"

  Scenario: Creating a project
    # And I fill in "Name" with "TextMate 2"
    # And I press "Create Project"
    When I create a project called "TextMate 2"
    # Then I should see "Project has been created."
    Then I should be shown the message for project creation
    And I should be on the project page for "TextMate 2"
    # And I should see "TextMate 2 - Projects - Ticketee"

  Scenario: Creating a project without a name
    # And I press "Create Project"
    When I try to create a project without a name
    # Then I should see "Project has not been created."
    Then I should be informed that the project has not been created
    # And I should see "Name can't be blank"
    And I should be told that the name is required
