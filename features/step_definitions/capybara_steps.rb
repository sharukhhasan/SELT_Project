# tests login
Given /^I am on the Spotitude homepage$/ do
  visit '/'
end

When /^I click the login button$/ do
  configure_spotify_omniauth
  click_button 'Login With Spotify!'
end

Then /^I should be logged in$/ do
  page.has_content?('Sign out here!')
end

# tests logout
Given /^I am logged into Spotitude already$/ do
  configure_spotify_omniauth
  visit '/'
  click_button 'Login With Spotify!'
end

When /^I click the logout button$/ do
  click_button 'Sign out here!'
end

Then /^I should be logged out of Spotitude$/ do
  page.has_content?('Login With Spotify!')
end

Then /^I should see all my Spotify playlists$/ do
  page.all('.playlist-name').count.should === @myNumberOfPlaylists
end

When /^I click the YouTube authorize button$/ do
  click_button
end
def configure_spotify_omniauth # function that tells omniauth gem to mock authentication flow for integration testing purposes
  OmniAuth.config.test_mode = true
  #myUID = "1254639538"
  #myName = "Bill Rashid"
  #myEmail = "mbrashid62@yahoo.com"
  #@myNumberOfPlaylists = 15
  myUID = "aleinoff"
  myName = "Alexander Leinoff"
  myEmail = "ajjleinoff@gmail.com"
  @myNumberOfPlaylists = 6

  OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
     :provider => 'spotify',
     :uid => "#{myUID}",
     :info => {
         :display_name =>  "#{myName}",
         :email => "#{myEmail}",
         :external_urls => {
             :spotify => "https://open.spotify.com/user/#{myUID}"
         },
         :followers => {
             :href => nil,
             :total => 20
         },
         :href => "https://api.spotify.com/v1/users/#{myUID}",
         :id => "#{myUID}",
         :images => [{}],
         :url => '',
         :width => nil,
     },
     :type => 'user',
     :uri => "spotify:user:#{myUID}",
     :credentials => {
         :token => 'BQDQcSp-sjJhjAYwneBh6ihKJdjl2lr0TLUdnP90g8suOMHPUKrphr8zofpF8-XM1Y8z4KXcBiWNqdvGMtX2tTJ-cgXqC8cce43b46ZX4CJVpd1TcBErtrf28RfqMcbEQuHndxnpON3tQS4HGlVt8Lz_cZQSQXy6XxzgzZFaXETPMgGIrezdkM6ayZ5Urn9HssLLRp2PATKQQ6w',
         :refresh_token => 'AQDXykZgL9aArA9BdGlB3WTB2w0OK-J3pBJm9QXu5iliRwwcF98SVXrO4wlkGXyEX2FASrAQOTtNPgumDOzVfe8t4BM0u3Qj_EOVZ-X6nZlUzpK0EQvLOKLP0u8s1NXYNW4',
         :expires_at => '1479364946',
         :expires => true
     },
     :extra => {}
  })
end
