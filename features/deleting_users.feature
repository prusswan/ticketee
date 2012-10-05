Feature: Deleting users
  In order to remove users
  As an admin
  I want to click a button and delete them

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
      | user@ticketee.com  | password | false |
    And I am signed in as "admin@ticketee.com"
    Given I am on the homepage
    # When I follow "Admin"
    # And I follow "Users"
    When I navigate to the users page

  Scenario: Deleting a user
    # And I follow "user@ticketee.com"
    # When I follow "Delete User"
    And I delete the user called "user@ticketee.com"
    # Then I should see "User has been deleted"
    Then I should be informed that the user has been deleted

  Scenario: Users cannot delete themselves
    # When I follow "admin@ticketee.com"
    # And I follow "Delete User"
    And I delete the user called "admin@ticketee.com"
    # Then I should see "You cannot delete yourself!"
    Then I should be informed that I cannot delete myself
