Feature: Creating Users
  In order to add new users to the system
  As an admin
  I want to be able to add them through the backend

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    # And I am signed in as them
    And I am signed in as "admin@ticketee.com"
    Given I am on the homepage
    # When I follow "Admin"
    # And I follow "Users"
    When I navigate to the users page
    # When I follow "New User"

  Scenario: Creating a new user
    # And I fill in "Email" with "newbie@ticketee.com"
    # And I fill in "Password" with "password"
    # And I press "Create User"
    And I create a user with the email "newbie@ticketee.com" and the password "password"
    # Then I should see "User has been created."
    Then I should be informed that the user has been created

  Scenario: Leaving email blank results in an error
    # And I fill in "Email" with ""
    # And I fill in "Password" with "password"
    # And I press "Create User"
    And I create a user with the email "" and the password "password"
    # Then I should see "User has not been created."
    Then I should be informed that the user has not been created
    # And I should see "Email can't be blank"
    And I should be told that the email is required
