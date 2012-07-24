Feature: Twitter auth
  In order to sign in using Twitter
  As a Twitter user
  I want to click an icon and be signed in

  Background:
    Given we are mocking a successful Twitter response

  Scenario: Signing in with Twitter
    Given I am on the homepage
    # When I follow "sign_in_with_twitter"
    When I sign in with Twitter
    # Then I should see "Signed in with Twitter successfully."
    # And I should see "Signed in as A Twit (@twit)"
    Then I should be signed in as "A Twit (@twit)"
