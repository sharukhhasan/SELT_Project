require 'rails_helper'
require 'rspec/rails'

RSpec.describe YoutubePlaylistController, type: :controller do

  describe '#config_yt_gem' do
    it 'should configure the yt_gem' do
      subject.config_yt_gem
      cid = Yt.configuration.client_id.should eq('1095677510377-98krukjir1j472p4q3g7gb18oej274t2.apps.googleusercontent.com')
      cs  =     Yt.configuration.client_secret === '4UQ2tXPd9fIaUrOLuNdS9lE'
      ck =     Yt.configuration.api_key === 'AIzaSyDl03kJVnB5b62LjXXnPgWKCoG_F4c5uyU'
      result = cid and cs and ck
      expect(result).to eq(true)
    end

    it 'should do the index' do
      post :index
      expect(response).to render_template(:index)
    end

    it 'should render yt_logged_in url when the user has clicked a playlist' do
      auth_hash = configure_omniauth

      # manual mock
      class YoutubePlaylistController
        def is_yt_playlist_already_created(arg)
          return false
        end
        def create_yt_playlist(arg1, arg2)
          return false
        end
      end

      get :yt_logged_in, nil, {:yt_token => auth_hash.credentials[:token],
                               :selected_playlist_name => "testPlaylistName" }

      expect(response).to render_template(:yt_logged_in)
    end

  end
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
