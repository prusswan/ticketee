Feature: Creating Tickets
  In order to create tickets for projects
  As a user
  I want to be able to select a project and do that

  Background:
    Given there is a project called "Internet Explorer"
    And there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am on the homepage
    # When I follow "Internet Explorer"
    When I navigate to the "Internet Explorer" project page
    # And I follow "New Ticket"
    And I create a ticket
    # Then I should see "You need to sign in or sign up before continuing."
    Then I should be informed that I need to sign in or sign up
    # When I fill in "Email" with "user@ticketee.com"
    # And I fill in "Password" with "password"
    # And I press "Sign in"
    When I sign in with the email "user@ticketee.com" and the password "password"
    # Then I should see "New Ticket

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
