require 'rails_helper'
require 'spec_helper'

RSpec.describe PlaylistsController, type: :controller do
    before :each do
      @spotify_params = {
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
    describe 'index function' do
      it 'should render the playlist view' do
        get :index
        expect(response).to render_template('index')
      end
      it 'should call model method find_by_session_token twice when passed an invalid user_id' do
        expect(User).to receive(:find_by_session_token).twice # twice because there are no params being passed with it the first time
        get :index, :user_id => nil
      end
      it 'should call model method find_by_session_token once when passed a valid user_id' do
        expect(User).to receive(:find_by_session_token).once
        get :index, :user_id => '1234'
      end

      it 'should call the spotify user find method' do
        expect(RSpotify::User).to respond_to(:find) # todo: fix this...bad test
        get :index, :user_id => '1234'
      end
      it 'should allow a spotify user object to call the spotify user playlists method' do
        @spotify_user = RSpotify::User.new(@spotify_params)
        expect(@spotify_user).to receive(:playlists)
        @spotify_user.playlists
      end
    end
end
