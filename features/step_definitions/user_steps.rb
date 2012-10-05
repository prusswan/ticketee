When /^I sign up with the email "(.*?)" and the password "(.*?)"$/ do |email, password|
  click_on 'Sign up'
  fill_in 'Email',                 with: email
  fill_in 'Password',              with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

Then /^I should be informed that I have (.*+)$/ do |message|
  page.should have_content("You have #{message}.")
end
