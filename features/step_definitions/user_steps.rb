When /^I sign up with the email "(.*?)" and the password "(.*?)"$/ do |email, password|
  click_on 'Sign up'
  fill_in 'Email',                 with: email
  fill_in 'Password',              with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

Then /^I should be informed that I have (.*+)$/ do |message|
  page.body.should match(%r{#{message}}i)
end

Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true"
    admin = attributes.delete("admin") == "true"
    @user = User.create!(attributes)
    @user.update_attribute("admin", admin)
    @user.confirm! unless unconfirmed
  end
end

Then /^I should be informed that my account was (.*+)$/ do |message|
  page.should have_content("Your account was #{message}")
end

Then /^I should be signed in as "(.*?)"$/ do |user|
  page.should have_content("Signed in as #{user}")
end

When /^I sign in with the email "(.*?)" and the password "(.*?)"$/ do |email, password|
  click_on 'Sign in'
  fill_in 'Email',    with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end

Then /^I should be informed that I need to (.+)$/ do |message|
  page.should have_content("need to #{message}")
end

Given /^I am signed in as "(.*?)"(?: with the password "(.*?)"|)$/ do |user, password|
  # When I follow "Sign in"
  # And I fill in "Email" with "#{@user.email}"
  # And I fill in "Password" with "password"
  # And I press "Sign in"
  # Then I should see "Signed in successfully."

  password = "password" unless password

  steps(%Q{
    Given I am on the homepage
    When I sign in with the email "#{user}" and the password "#{password}"
    Then I should be informed that I have signed in successfully
  })
end
