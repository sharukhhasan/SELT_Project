require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
    before :each do
        request.env['omniauth.auth'] = {
            :provider => "spotify",
            :uid => "1111111111",
            :info => {
                :name => "Claudio Poli",
                :nickname => 'SomeName',
                :email => "claudio@icorete.ch",
                :urls => {:spotify => "https://open.spotify.com/user/1111111111"},
                :image => 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/t1.0-1/s320x320/301234_1962753760624_625151598_n.jpg'
            },
            :credentials => {
                :token => "xxxx",
                :refresh_token => "xxxx",
                :expires_at => 1403021232,
                :expires => true
            },
            :extra => {
                :raw_info => {
                    :country => "IT",
                    :display_name => "Claudio Poli",
                    :email => "claudio@icorete.ch",
                    :external_urls => {
                    :spotify => "https://open.spotify.com/user/1111111111"
                },
                :href => "https://api.spotify.com/v1/users/1111111111",
                :id => "1111111111",
                :images => [{
                    "height" => nil,
                    "url" => "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/t1.0-1/s320x320/301234_1962753760624_625151598_n.jpg",
                    "width" => nil
                }],
                :product => "open",
                :type => "user",
                :uri => "spotify:user:1111111111"
                }
            }
        }
    end
    describe "Creating a Session" do
        it "should redirect to root_url" do
            post :create
            expect(response).to redirect_to(root_url)
        end
        it "should make sure session_token is not nil" do
            post :create
            expect(session[:session_token]).not_to eq(nil)
        end
        it "should expect current session_token to equal user.session_token" do
            post :create
            spotify_user = RSpotify::User.new(request.env['omniauth.auth']) # get a spotify user using omniauth token
            user = User.find_by_uid(spotify_user.id) # lookup by id
            expect(session[:session_token]).to eq(user.session_token)
        end
        it "should call model method user.find_by_user_id" do
            expect(User).to receive(:find_by_uid).once
            post :create
        end

        # it "should redirect to playlists/index" do #Todo: fix this test, I don't know why it's redirecting to root instead of playlist/index
        #     post :create
        #     expect(response).to redirect_to(root_url)
        # end
    end
    
    describe "Destroying a Session" do
        before :each do
            post :destroy
        end
        it "should redirect to root_url" do
            expect(response).to redirect_to(root_url)
        end
        it "should set session_token" do
            expect(session[:session_token]).to eq nil
        end
    end
end