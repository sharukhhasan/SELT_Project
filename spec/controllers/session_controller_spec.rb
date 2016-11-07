require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
    before :each do
        @test = {:id => 1, :provider => nil, :uid => "ian-ingram", :name => "ian-ingram@uiowa.edu", :session_token => "369kgallRNfV0d1S5e4aKA", :created_at => "2016-11-01 21:00:19", :updated_at => "2016-11-01 21:00:19"}
    end
    describe "Creating a Session" do
        it "should redirect to playlists_index_url" do
            expect(response.status).to eq(200)
        end
        
        it "should use user session if user is in db" do
            expect(User.find_by_uid("ian-ingram")).to eq(User.find_by_uid(@test[:uid]))
        end
        
        it "should create a user if one is not found" do
            expect(User).to eq(User.create_with_omniauth(@test))
        end
    end

    describe "Creating a Session" do
        before :each do
            @auth = {:birthdate => nil, :country => nil, :display_name => nil, :email => "ian-ingram@uiowa.edu", :images => [], :product => nil, :href => "https://api.spotify.com/v1/users/ian-ingram", :id => "ian-ingram", :type => "user", :uri => "spotify:user:ian-ingram"}
            post :create
        end
        it "should redirect to root_url" do
            expect(User).to redirect_to(root_url)
        end
        it 'should set session_token' do
            expect(@auth [:session_token]).not_to eq(nil)
        end
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