
Given /^I am on signed in$/ do # tests if login button exists
  visit root_path
  visit oauth_callback_path
 end

  When /^I am not logged into Spotitude$/ do
      visit root_path
  end

  Then /^I should see the login button$/ do
     result = false

     if page.has_button?('Login With Spotify!')
        result = true
     end
     expect(result).to be_truthy
  end
