Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

    Background:
      Given there are the following users:
        | email              | password | admin |
        | admin@ticketee.com | password | true  |
      # And I am signed in as them
      And I am signed in as "admin@ticketee.com"

      And there are the following users:
        | email             | password |
        | user@ticketee.com | password |
      And there is a project called "TextMate 2"

      # When I follow "Admin"
      # And I follow "Users"
      When I navigate to the users page
      # And I follow "user@ticketee.com"
      # And I follow "Permissions"
      And I view the permissions for the user "user@ticketee.com"

    Scenario: Viewing a project
      # When I check "View" for "TextMate 2"
      # And I press "Update"
      When I enable "View" for the project "TextMate 2"
      # And I follow "Sign out"
      And I sign out
      Given I am signed in as "user@ticketee.com"
      # Then I should see "TextMate 2"
      Then I should be shown the project "TextMate 2"
