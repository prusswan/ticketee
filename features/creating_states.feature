Feature: Creating states
  In order to be able to specify other states for tickets
  As an admin
  I want to add them to the application

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    # And I am signed in as them
    And I am signed in as "admin@ticketee.com"

  Scenario: Creating a state
    # When I follow "Admin"
    # And I follow "States"
    When I navigate to the states page
    # And I follow "New State"
    # And I fill in "Name" with "Duplicate"
    # And I press "Create State"
    And I create a state called "Duplicate"
    # Then I should see "State has been created."
    Then I should be informed that the state has been created
