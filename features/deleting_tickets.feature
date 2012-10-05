Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them disappear

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    # When I follow "TextMate 2"
    When I navigate to the "TextMate 2" project page
    # And I follow "Make it shiny!"

  @javascript
  Scenario: Deleting a ticket
    # When I follow "Delete Ticket"
    And I delete the ticket called "Make it shiny!"
    # Then I should see "Ticket has been deleted."
    Then I should be informed that the ticket has been deleted
    And I should be on the project page for "TextMate 2"
