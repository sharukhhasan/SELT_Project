require 'rails_helper'

RSpec.describe YoutubePlaylistController, type: :controller do

  before :each do
    auth_hash = {
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
                :images => [
                    {
                        "height" => nil,
                        "url" => "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/t1.0-1/s320x320/301234_1962753760624_625151598_n.jpg",
                        "width" => nil
                    }
                ],
                :product => "open",
                :type => "user",
                :uri => "spotify:user:1111111111"
            }
        }
    }
  end
  describe '#index' do
    it 'should '
  end

  # describe '#yt_logged_in' do
  #   it 'should config the yt gem' do
  #     get 'index'
  #     # @current_user.uid = '1234'
  #     # assigns(:@playlist_name).should_not be_nil
  #     response.should render_template :index
  #   end
  # end
end

