Feature: Creating comments
  In order to update a ticket's progress
  As a user
  I want to leave comments

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    # And I am signed in as them
    And I am signed in as "user@ticketee.com"
    And there is a project called "Ticketee"
    And "user@ticketee.com" can view the "Ticketee" project
    And "user@ticketee.com" can tag the "Ticketee" project
    # And "user@ticketee.com" has created a ticket for this project:
    And that project has a ticket created by "user@ticketee.com":
      | title                   | description                            |
      | Change a ticket's state | You should be able to create a comment |
    And there is a state called "Open"
    Given I am on the homepage
    # And I follow "Ticketee"
    And I navigate to the "Ticketee" project page

  Scenario: Creating a comment
    # When I follow "Change a ticket's state"
    When I navigate to the "Change a ticket's state" ticket page
    # And I fill in "Text" with "Added a comment!"
    # And I press "Create Comment"
    And I create a comment with the text "Added a comment!"
    # Then I should see "Comment has been created."
    Then I should be informed that the comment has been created
    # And I should see "Added a comment!" within "#comments"
    And I should be shown the comment "Added a comment!"

  Scenario: Creating an invalid comment
    # When I follow "Change a ticket's state"
    When I navigate to the "Change a ticket's state" ticket page
    # And I press "Create Comment"
    And I create a comment with the text ""
    # Then I should see "Comment has not been created."
    Then I should be informed that the comment has not been created
    # And I should see "Text can't be blank"
    And I should be told that the text is required

  Scenario: Changing a ticket's state
    Given "user@ticketee.com" can change states on the "Ticketee" project
    # When I follow "Change a ticket's state"
    When I navigate to the "Change a ticket's state" ticket page
    # And I fill in "Text" with "This is a real issue"
    # And I select "Open" from "State"
    # And I press "Create Comment"
    And I create a comment with the text "This is a real issue" and the state "Open"
    # Then I should see "Comment has been created."
    Then I should be informed that the comment has been created
    # And I should see "Open" within "#ticket .state
    And I should be shown the comment "This is a real issue" with the state "Open"
    # And I should see "Open" within "#comments"
    And I should be shown comments containing the state "Open"

  Scenario: A user without permission cannot change the state
    # When I follow "Change a ticket's state"
    When I navigate to the "Change a ticket's state" ticket page
    When I create a comment with the text "This is a real issue" and the state "Open"
    Then I should not see the "#comment_state_id" element

  Scenario: Adding a tag to a ticket
    Given "user@ticketee.com" can change states on the "Ticketee" project
    # When I follow "Change a ticket's state"
    When I navigate to the "Change a ticket's state" ticket page
    # Then I should not see "bug" within "#ticket #tags"
    # And I fill in "Text" with "Adding the bug tag"
    # And I fill in "Tags" with "bug"
    # And I press "Create Comment"
    And I create a comment with the text "Adding the bug tag" and the tag "bug"
    # Then I should see "Comment has been created"
    Then I should be informed that the comment has been created
    # Then I should see "bug" within "#ticket #tags"
    And I should be shown the ticket with the tag "bug"
