require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
    before :each do
      request.env['omniauth.auth'] = configure_spotify_omniauth
    end
    describe "Creating a Session" do
        before :each do
            #@auth = {:birthdate => nil, :country => nil, :display_name => nil, :email => "ian-ingram@uiowa.edu", :images => [], :product => nil, :href => "https://api.spotify.com/v1/users/ian-ingram", :id => "ian-ingram", :type => "user", :uri => "spotify:user:ian-ingram"}
            post :create
        end

        it "should redirect to root url" do
            expect(User).to redirect_to(make_youtube_url)
        end
        it 'should check session_token is not nil' do
            spotify_user = RSpotify::User.new(request.env['omniauth.auth']) # get a spotify user using omniauth token
            user = User.find_by_uid(spotify_user.id)|| # lookup by id
              User.create_with_omniauth(spotify_user) # if no user is found create one
            expect(session[:session_token]).not_to eq(nil)
        end
        it 'should expect session_token to equal user.session_token' do
            spotify_user = RSpotify::User.new(request.env['omniauth.auth']) # get a spotify user using omniauth token
            user = User.find_by_uid(spotify_user.id)|| # lookup by id
              User.create_with_omniauth(spotify_user) # if no user is found create one
            expect(session[:session_token]).to eq(user.session_token)
        end
    end

    describe "Authing with youtube" do
      before :each do
        post :youtube_create
      end

if false
      pending it 'should expect auth_hash to not be nil' do
        expect(auth_youtube_hash).not_to eq(nil)
      end
end
      # it 'should redirect to youtube loggedin url' do
      #   expect(User).to redirect_to(youtube_logged_in_url)
      # end
    end

    describe "Destroying a Session" do
        before :each do
            post :destroy
        end
        it "should redirect to root_url" do
            expect(User).to redirect_to(root_url)
        end
        it 'should set session_token' do
            expect(session[:session_token]).to eq nil
        end
    end

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
end
