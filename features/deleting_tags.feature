Feature: Deleting tags
  In order to remove old tags
  As a user
  I want to click a button and make them go away

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
      | title | description       | tag_names         |
      | A tag | Tagging a ticket! | this-tag-must-die |
    Given I am on the homepage
    # When I follow "Ticketee" within "#projects"
    When I navigate to the "Ticketee" project page
    # And I follow "A tag"
    And I navigate to the "A tag" ticket page

  @javascript
  Scenario: Deleting a tag
    # When I follow "delete-this-tag-must-die"
    When I delete the tag "this-tag-must-die"
    # Then I should not see "this-tag-must-die"
    Then I should not be shown the tag "this-tag-must-die"
