Feature: Ticket Notifications
  Background:
    Given there are the following users:
      | email              | password |
      | alice@ticketee.com | password |
      | bob@ticketee.com   | password |

    Given a clear email queue

    Given there is a project called "TextMate 2"
    And "alice@ticketee.com" can view the "TextMate 2" project
    And "bob@ticketee.com" can view the "TextMate 2" project
    # And "alice@ticketee.com" has created a ticket for this project:
    And that project has a ticket created by "alice@ticketee.com":
      | title        | description       |
      | Release date | TBA very shortly. |

    Given I am signed in as "bob@ticketee.com"
    Given I am on the homepage

  Scenario: Ticket owner is automatically subscribed to a ticket
    # When I follow "TextMate 2"
    When I navigate to the "TextMate 2" project page
    # And I follow "Release date"
    And I navigate to the "Release date" ticket page
    # And I fill in "Text" with "Is it out yet?"
    # And I press "Create Comment"
    And I create a comment with the text "Is it out yet?"

    Then "alice@ticketee.com" should receive an email
    When "alice@ticketee.com" opens the email
    Then they should see "updated the Release date ticket" in the email body
    And the email should contain 2 parts
    And there should be a part with content type "text/plain"
    And there should be a part with content type "text/html"
    And they should see "[ticketee] TextMate 2 - Release date" in the email subject
    Then they follow "view this ticket online here" in the email
    # Then I should see "Release date" within "#ticket h2"
    Then I should be on the ticket page for "Release date"

  Scenario: Comment authors are automatically subscribed to a ticket
    # When I follow "TextMate 2"
    When I navigate to the "TextMate 2" project page
    # And I follow "Release date"
    And I navigate to the "Release date" ticket page
    # And I fill in "Text" with "Is it out yet?"
    # And I press "Create Comment"
    And I create a comment with the text "Is it out yet?"
    # Then I should see "Comment has been created."
    Then I should be informed that the comment has been created
    # When I follow "Sign out"
    When I sign out

    Given a clear email queue

    Given I am signed in as "alice@ticketee.com"
    # When I follow "TextMate 2"
    When I navigate to the "TextMate 2" project page
    # And I follow "Release date"
    And I navigate to the "Release date" ticket page
    # And I fill in "Text" with "Not yet!"
    # And I press "Create Comment"
    And I create a comment with the text "Not yet!"
    # Then I should see "Comment has been created."
    Then I should be informed that the comment has been created
    Then "bob@ticketee.com" should receive an email
    Then "alice@ticketee.com" should have no emails
