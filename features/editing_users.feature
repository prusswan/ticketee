Feature: Editing a user
  In order to change a user's details
  As an admin
  I want to be able to modify them through the backend

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
      | user@ticketee.com  | password | false |
    # And I am signed in as them
    And I am signed in as "admin@ticketee.com"

    Given I am on the homepage
    # When I follow "Admin"
    # And I follow "Users"
    When I navigate to the users page
    # And I follow "user@ticketee.com"
    # And I follow "Edit User"

  Scenario: Updating a user's details
    # When I fill in "Email" with "newguy@ticketee.com"
    # And I press "Update User"
    And I update the user "user@ticketee.com" with the email "newguy@ticketee.com"
    # Then I should see "User has been updated."
    Then I should be informed that the user has been updated
    # And I should see "newguy@ticketee.com"
    And I should be shown the user "newguy@ticketee.com"
    # And I should not see "user@ticketee.com"
    And I should not be shown the user "user@ticketee.com"

  Scenario: Toggling a user's admin ability
    # When I check "Is an admin?"
    # And I press "Update User"
    And I update the user "user@ticketee.com" to an admin
    # Then I should see "User has been updated."
    # And I should see "user@ticketee.com (Admin)"
    Then I should be informed that the admin user has been updated

  Scenario: Updating with an invalid email fails
    # When I fill in "Email" with "fakefakefake"
    # And I press "Update User"
    And I update the user "user@ticketee.com" with the email "fakefakefake"
    # Then I should see "User has not been updated."
    Then I should be informed that the user has not been updated
    # And I should see "Email is invalid"
    And I should be told that the email is invalid
