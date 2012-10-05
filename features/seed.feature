Feature: Seed Data
  In order to fill the database with the basics
  As the system
  I want to run the seed task

  Scenario: The basics
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    # When I follow "Ticketee Beta"
    When I navigate to the "Ticketee Beta" project page
    # And I follow "New Ticket"
    # And I fill in "Title" with "Comments with state"
    # And I fill in "Description" with "Comments always have a state."
    # And I press "Create Ticket"
    And I create a ticket with the title "Comments with state" and the description "Comments always have a state."
    # Then I should see "New" within "#comment_state_id"
    Then I should be shown the state "New"
    # And I should see "Open" within "#comment_state_id"
    And I should be shown the state "Open"
    # And I should see "Closed" within "#comment_state_id"
    And I should be shown the state "Closed"
