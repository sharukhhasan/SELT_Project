# tests login
Given /^I am on the Spotitude homepage$/ do
  visit '/'
end

When /^I click the login button$/ do
  configure_omniauth
  click_button 'Login With Spotify and Youtube!'
end

Then /^I should be logged in$/ do
  page.has_content?('Sign out here!')
end

# tests logout
Given /^I am logged into Spotitude already$/ do
  configure_omniauth
  visit '/'
  click_button 'Login With Spotify and Youtube!'
end

When /^I click the logout button$/ do
  click_button 'Sign out here!'
end

Then /^I should be logged out of Spotitude$/ do
  page.has_content?('Login With Spotify and Youtube!')
end

Then /^I should see all my Spotify playlists$/ do
  page.all('.playlist-name').count.should === @myNumberOfPlaylists
end

When /^I click the YouTube authorize button$/ do
  click_button
end

When /^I click a Spotify playlist$/ do
  first('.playlist-name').click
  # page.driver.browser.mouse.double_click(element.native)
end

Then /^I should see my selected playlist$/ do
  page.has_content?('Create a YouTube Playlist')
end

Given /^I have selected a playlist$/ do
  configure_spotify_omniauth
  visit '/'
  click_button 'Login With Spotify!'
  first('.playlist-name').click
end

When /^I click the youtube playlist button$/ do
  configure_youtube_omniauth
  click_button 'Create a YouTube Playlist'
end

Then /^I should see a youtube video$/ do
  page.has_content?('Enjoy your new YouTube playlist')
end

def configure_omniauth # function that tells omniauth gem to mock authentication flow for integration testing purposes
  OmniAuth.config.test_mode = true
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
         :country => "USA",
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


  OmniAuth.config.add_mock( :google_oauth2, {
      "provider" => "google_oauth2",
      "uid" => "103712197192383640557",
      "info" => {
          "name" => "Alex L",
          "email" => "ajjleinoff@gmail.com",
          "first_name" => "Alex",
          "last_name" => "L",
          "image" => "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg",
          "urls" => {
              "Google" => "https://plus.google.com/103712197192383640557"
          }
      },
      "credentials" => {
          "token" => "ya29.Ci-uA4iyGBxQk90XMOx0zhlMciZus1V4DJE4QaLPL0sLrTEAN6lzu2ocYMGfFNQe5w",
          "refresh_token" => "1/8J4AdTOzpQSvAYByWNY0e2Kg6aEmzrgLyvKRg5bECDfIeNk2CcQMmx8ZFzxbXtLj",
          "expires_at" => 1481191145,
          "expires" => true
      },
  })
end

def configure_youtube_omniauth # function that tells omniauth gem to mock authentication flow for integration testing purposes
  OmniAuth.config.test_mode = true
  myUID = "aleinoff"
  myName = "Alexander Leinoff"
  myEmail = "ajjleinoff@gmail.com"
  @myNumberOfPlaylists = 6

  OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
       :provider => 'google_oauth2',
       :uid => "#{myUID}",
       :info => {
           :display_name =>  "#{myName}",
           :email => "#{myEmail}",
           # :external_urls => {
           #     :spotify => "https://open.spotify.com/user/#{myUID}"
           # },
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


