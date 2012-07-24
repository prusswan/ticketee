Given /^we are mocking a successful Twitter response$/ do
  OmniAuth.config.mock_auth[:twitter] = {
    "extra" => {
      "user_hash" => {
        "id" => '12345',
        "screen_name" => 'twit',
        "display_name" => "A Twit"
      }
    }
  }
end

When /^I sign in with Twitter$/ do
  click_on 'sign_in_with_twitter'
end
