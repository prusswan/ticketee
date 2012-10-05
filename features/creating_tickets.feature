Feature: Creating Tickets
  In order to create tickets for projects
  As a user
  I want to be able to select a project and do that

  Background:
    Given there is a project called "Internet Explorer"
    And there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And "user@ticketee.com" can view the "Internet Explorer" project
    And "user@ticketee.com" can create tickets in the "Internet Explorer" project
    # And I am signed in as them
    And I am signed in as "user@ticketee.com"
    And I am on the homepage
    # When I follow "Internet Explorer"
    When I navigate to the "Internet Explorer" project page
    # And I follow "New Ticket"

  Scenario: Creating a ticket
    # When I fill in "Title" with "Non-standards compliance"
    # And I fill in "Description" with "My pages are ugly!"
    # And I press "Create Ticket"
    And I create a ticket with the title "Non-standards compliance" and the description "My pages are ugly!"
    # Then I should see "Ticket has been created."
    # And I should see "Created by user@ticketee.com"
    Then I should be informed that the ticket has been created by "user@ticketee.com"

  Scenario: Creating a ticket without valid attributes fails
    # And I press "Create Ticket"
    And I create a ticket with the title "" and the description ""
    # Then I should see "Ticket has not been created."
    Then I should be informed that the ticket has not been created
    # And I should see "Title can't be blank"
    # And I should see "Description can't be blank"
    And I should be told that the title and the description are required

  Scenario: Description must be longer than 10 characters
    # When I fill in "Title" with "Non-standards compliance"
    # And I fill in "Description" with "it sucks"
    # And I press "Create Ticket"
    And I create a ticket with the title "Non-standards compliance" and the description "it sucks"
    # Then I should see "Ticket has not been created."
    Then I should be informed that the ticket has not been created
    # And I should see "Description is too short"
    And I should be told that the description is too short

  @javascript
  Scenario: Creating a ticket with an attachment
    # When I fill in "Title" with "Add documentation for blink tag"
    # And I fill in "Description" with "The blink tag has a speed attribute"
    # And I attach the file "spec/fixtures/speed.txt" to "File #1"
    # And I follow "Add another file"
    # And I attach the file "spec/fixtures/spin.txt" to "File #2"
    # And I press "Create Ticket"
    And I create a ticket with the title "Add documentation for blink tag" and the description "The blink tag has a speed attribute" and the attachment "spec/fixtures/speed.txt" for "File #1" and the attachment "spec/fixtures/spin.txt" for "File #2"
    # Then I should see "Ticket has been created."
    Then I should be informed that the ticket has been created
    # And I should see "speed.txt" within "#ticket .asset"
    And I should be shown the ticket with the attachment "speed.txt"
    # And I should see "spin.txt" within "#ticket .assets"
    And I should be shown the ticket with the attachment "spin.txt"
