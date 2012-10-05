Feature: Searching
  In order to find specific tickets
  As a user
  I want to enter a search query and get results

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    # And I am signed in as them
    And I am signed in as "user@ticketee.com"
    And there is a project called "Ticketee"
    And "user@ticketee.com" can view the "Ticketee" project
    And "user@ticketee.com" can tag the "Ticketee" project
    # And "user@ticketee.com" has created a ticket for this project:
    And that project has a ticket created by "user@ticketee.com":
      | title | description     | tag_names   | state |
      | Tag!  | Hey! You're it! | iteration_1 | Open  |
    # And "user@ticketee.com" has created a ticket for this project:
    And that project has a ticket created by "user@ticketee.com":
      | title   | description      | tag_names   | state  |
      | Tagged! | Hey! I'm it now! | iteration_2 | Closed |
    Given I am on the homepage
    # And I follow "Ticketee" within "#projects"
    And I navigate to the "Ticketee" project page

  Scenario: Finding by tag
    # When I fill in "Search" with "tag:iteration_1"
    # And I press "Search"
    When I search for the tag "iteration_1"
    # Then I should see "Tag!"
    Then I should be shown the ticket "Tag!"
    # And I should not see "Tagged!"
    And I should not be shown the ticket "Tagged!"

  Scenario: Finding by state
    # When I fill in "Search" with "state:Open"
    # And I press "Search"
    When I search for the state "Open"
    # Then I should see "Tag!"
    Then I should be shown the ticket "Tag!"
    # And I should not see "Tagged!"
    And I should not be shown the ticket "Tagged!"

  Scenario: Clicking a tag goes to search results
    # When I follow "Tag!"
    When I navigate to the "Tag!" ticket page
    # And I follow "iteration_1"
    And I navigate to the "iteration_1" tag page
    # Then I should see "Tag!"
    Then I should be shown the ticket "Tag!"
    # And I should not see "Tagged!"
    And I should not be shown the ticket "Tagged!"
