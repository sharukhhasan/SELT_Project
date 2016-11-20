require 'rails_helper'
require 'spec_helper'

RSpec.describe PlaylistsController, type: :controller do
    
    describe 'when logged in' do
        before :each do
            post :index 
        end
        it 'should render playlists/index view' do
            expect(User).to redirect_to(playlists_index_url)
        end
    end
    
    describe 'signed_in_user is not nil' do
        before :each do
            post :index 
            signed_in_user = User.find_by_session_token(session[:session_token]) # grab user from db using session token
            user_id = signed_in_user.uid
        end
        it 'should set user_id = signed_in_user.uid' do
            expect(user_id).to eq(signed_in_user.uid)
        end
    end
end
