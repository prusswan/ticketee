Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

  Scenario: Signing in via confirmation
    Given there are the following users:
      | email             | password | unconfirmed |
      | user@ticketee.com | password | true        |
    And "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    # Then I should see "Your account was successfully confirmed"
    Then I should be informed that my account was successfully confirmed
    # And I should see "Signed in as user@ticketee.com"
    And I am signed in as "user@ticketee.com"

  Scenario: Signing in via form
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am on the homepage
    # When I follow "Sign in"
    # And I fill in "Email" with "user@ticketee.com"
    # And I fill in "Password" with "password"
    # And I press "Sign in"
    When I sign in with the email "user@ticketee.com" and the password "password"
    # Then I should see "Signed in successfully."
    Then I should be informed that I have signed in successfully
