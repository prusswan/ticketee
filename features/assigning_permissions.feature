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
      # And "user@ticketee.com" has created a ticket for this project:
      And that project has a ticket created by "user@ticketee.com":
        | title  | description       |
        | Shiny! | Eye-blindingly so |

      # When I follow "Admin"
      # And I follow "Users"
      When I navigate to the users page
      # And I follow "user@ticketee.com"
      # And I follow "Permissions"
      And I view the permissions for the user "user@ticketee.com"
      Given there is a state called "Open"

    Scenario: Viewing a project
      # When I check "View" for "TextMate 2"
      # And I press "Update"
      When I enable "View" for the project "TextMate 2"
      # And I follow "Sign out"
      And I sign out
      Given I am signed in as "user@ticketee.com"
      # Then I should see "TextMate 2"
      Then I should be shown the project "TextMate 2"

    Scenario: Creating tickets for a project
      # When I check "View" for "TextMate 2"
      # When I check "Create tickets" for "TextMate 2"
      # And I press "Update"
      When I enable "View" for the project "TextMate 2"
      When I enable "Create tickets" for the project "TextMate 2"
      # And I follow "Sign out"
      And I sign out

      Given I am signed in as "user@ticketee.com"
      # When I follow "TextMate 2"
      When I navigate to the "TextMate 2" project page
      # And I follow "New Ticket"
      # And I fill in "Title" with "Shiny!"
      # And I fill in "Description" with "Make it so!"
      # And I press "Create"
      And I create a ticket with the title "Shiny!" and the description "Make it so!"
      # Then I should see "Ticket has been created."
      Then I should be informed that the ticket has been created

    Scenario: Updating a ticket for a project
      # When I check "View" for "TextMate 2"
      # And I check "Edit tickets" for "TextMate 2"
      # And I press "Update"
      When I enable "View" for the project "TextMate 2"
      When I enable "Edit tickets" for the project "TextMate 2"
      # And I follow "Sign out"
      And I sign out

      Given I am signed in as "user@ticketee.com"
      # When I follow "TextMate 2"
      When I navigate to the "TextMate 2" project page
      # And I follow "Shiny!"
      # And I follow "Edit"
      # And I fill in "Title" with "Really shiny!"
      # And I press "Update Ticket"
      And I rename the "Shiny!" ticket to "Really shiny!"
      # Then I should see "Ticket has been updated"
      Then I should be informed that the ticket has been updated

    Scenario: Deleting a ticket for a project
      # When I check "View" for "TextMate 2"
      # And I check "Delete tickets" for "TextMate 2"
      # And I press "Update"
      When I enable "View" for the project "TextMate 2"
      When I enable "Delete tickets" for the project "TextMate 2"
      # And I follow "Sign out"
      And I sign out

      Given I am signed in as "user@ticketee.com"
      # When I follow "TextMate 2"
      When I navigate to the "TextMate 2" project page
      # And I follow "Shiny!"
      # And I follow "Delete"
      And I delete the ticket called "Shiny!"
      # Then I should see "Ticket has been deleted."
      Then I should be informed that the ticket has been deleted

    Scenario: Changing states for a ticket
      # When I check "View" for "TextMate 2"
      # And I check "Change States" for "TextMate 2"
      # And I press "Update"
      When I enable "View" for the project "TextMate 2"
      And I enable "Change States" for the project "TextMate 2"
      # And I follow "Sign out"
      And I sign out

      Given I am signed in as "user@ticketee.com"
      # When I follow "TextMate 2"
      When I navigate to the "TextMate 2" project page
      # And I follow "Shiny!"
      And I navigate to the "Shiny!" ticket page
      # When I fill in "Text" with "Opening this ticket."
      # And I select "Open" from "State"
      # And I press "Create Comment"
      And I create a comment with the text "Opening this ticket." and the state "Open"
      # Then I should see "Comment has been created."
      Then I should be informed that the comment has been created
      # And I should see "Open" within "#ticket .state"
      And I should be shown the comment "Opening this ticket." with the state "Open"
