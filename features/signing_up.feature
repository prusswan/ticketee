Feature: Signing up
  In order to be attributed for my work
  As a user
  I want to be able to sign up

  Scenario: Signing up
    Given I am on the homepage
    # When I follow "Sign up"
    # And I fill in "Email" with "user@ticketee.com"
    # And I fill in "Password" with "password"
    # And I fill in "Password confirmation" with "password"
    # And I press "Sign up"
    When I sign up with the email "user@ticketee.com" and the password "password"
    # Then I should see "You have signed up successfully."
    Then I should be informed that I have signed up successfully
    # Then I should see "Please confirm your account before signing in."
    And I should be asked to confirm my account before signing in
