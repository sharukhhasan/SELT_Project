require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
    context 'when logged in' do
        it { is_expected.to respond_with 200 }
    end
    context 'when logged out' do
        it { is_expected.to respond_with 401 }
    end
    
    describe "Creating a Session" do
        before :each do
            post :create
        end
        it "should redirect to playlist_index_url" do
          expect(User).to redirect_to(playlists_index_url)
        end
        it 'should set session_token' do
            expect(session[:session_token]).to eq user.session_token
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