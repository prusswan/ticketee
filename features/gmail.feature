Feature: Gmail
  In order to send real world emails
  As the application
  I want to ensure my configuration is correct

  Background:
    Given there are the following users:
      | email              | password |
      | alice@ticketee.com | password |
      | prusswan@gmail.com | password |

    And Action Mailer delivers via SMTP

    Given there is a project called "TextMate 2"
    And "alice@ticketee.com" can view the "TextMate 2" project
    And "prusswan@gmail.com" can view the "TextMate 2" project
    # And "youraccount@example.com" has created a ticket for this project:
    And that project has a ticket created by "prusswan@gmail.com":
      | title        | description       |
      | Release date | TBA very shortly. |

  Scenario: Receiving a real-world email
    Given I am signed in as "alice@ticketee.com"
    Given I am on the homepage
    # When I follow "TextMate 2"
    When I navigate to the "TextMate 2" project page
    # And I follow "Release date"
    And I navigate to the "Release date" ticket page
    # And I fill in "Text" with "Posting a comment!"
    # And I press "Create Comment"
    And I create a comment with the text "Posting a comment!"
    # Then I should see "Comment has been created."
    Then I should be informed that the comment has been created

    When I log into gmail with:
      | username           | password |
      | prusswan@gmail.com | password |
    Then there should be an email from Ticketee in my inbox
