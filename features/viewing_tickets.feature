Feature: Viewing tickets
  In order to view the tickets for a project
  As a user
  I want to see them on that project's page

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    And there is a project called "Internet Explorer"
    And that project has a ticket:
      | title                | description   |
      | Standards compliance | Isn’t a joke. |

    And I am on the homepage

  Scenario: Viewing tickets for a given project
    # When I follow "TextMate 2"
    When I navigate to the "TextMate 2" project page
    # Then I should see "Make it shiny!"
    Then I should be shown the ticket "Make it shiny!"
    # And I should not see "Standards compliance"
    And I should not be shown the ticket "Standards compliance"
    # When I follow "Make it shiny!"
    When I navigate to the "Make it shiny!" ticket page
    # Then I should see "Make it shiny" within "#ticket h2"
    # And I should see "Gradients! Starbursts! Oh my!"
    Then I should be on the ticket page for "Make it shiny!"

    # When I follow "Ticketee"
    When I navigate to the homepage
    # And I follow "Internet Explorer"
    And I navigate to the "Internet Explorer" project page
    # Then I should see "Standards compliance"
    Then I should be shown the ticket "Standards compliance"
    # And I should not see "Make it shiny!"
    And I should not be shown the ticket "Make it shiny!"
    # When I follow "Standards compliance"
    When I navigate to the "Standards compliance" ticket page
    # Then I should see "Standards compliance" within "#ticket h2"
    # And I should see "Isn't a joke."
    Then I should be on the ticket page for "Standards compliance"
