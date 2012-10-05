Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit the tickets

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    # And I am signed in as them
    And I am signed in as "user@ticketee.com"
    And there is a project called "TextMate 2"
    # And "user@ticketee.com" has created a ticket for this project:
    And that project has a ticket created by "user@ticketee.com":
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    # When I follow "TextMate 2"
    When I navigate to the "TextMate 2" project page
    # And I follow "Make it shiny!"
    # When I follow "Edit Ticket"

  Scenario: Updating a ticket
    # When I fill in "Title" with "Make it really shiny!"
    # And I press "Update Ticket"
    And I rename the "Make it shiny!" ticket to "Make it really shiny!"
    # Then I should see "Ticket has been updated."
    Then I should be informed that the ticket has been updated
    # And I should see "Make it really shiny!" within "#ticket h2"
    And I should be on the ticket page for "Make it really shiny!"
    # But I should not see "Make it shiny!"
    And I should not be on the ticket page for "Make it shiny!"

  Scenario: Updating a ticket with invalid information
    # When I fill in "Title" with ""
    # And I press "Update Ticket"
    And I rename the "Make it shiny!" ticket to ""
    # Then I should see "Ticket has not been updated."
    Then I should be informed that the ticket has not been updated
