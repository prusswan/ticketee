Feature: Managing states
  In order to change information about a state
  As an admin
  I want to be able to set a state's name and default status

  Background:
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"

  Scenario: Marking a state as default
    Given I am on the homepage
    # When I follow "Admin"
    # And I follow "States"
    When I navigate to the states page
    And I follow "Make Default" for the "New" state
    # Then I should see "New is now the default state."
    Then I should be informed that "New" is now the default state
