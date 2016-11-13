# tests login
Given /^I am on the Spotitude homepage$/ do
  visit '/'
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
    :provider => 'spotify',
    :uid => '1254639538'
   })
end

When /^I click the login button$/ do
  click_button 'Login With Spotify!'
end

Then /^I should be logged in$/ do
  page.has_content?('Sign out Here!')
end


# tests logout
Given /^I am logged into Spotitude already$/ do
  visit '/'
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
     :provider => 'spotify',
     :uid => '1254639538'
   })
  click_button 'Login With Spotify!'
end

When /^I click the logout button$/ do
  click_button 'Sign out Here!'
end

Then /^I should be logged out of Spotitude$/ do
  page.has_content?('Login With Spotify!')
end