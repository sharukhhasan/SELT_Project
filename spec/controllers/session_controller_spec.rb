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
