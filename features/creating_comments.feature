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
    # And "user@ticketee.com" has created a ticket for this project:
    And that project has a ticket created by "user@ticketee.com":
      | title                   | description                            |
      | Change a ticket's state | You should be able to create a comment |
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
