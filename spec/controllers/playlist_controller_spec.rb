require 'rails_helper'
require 'spec_helper'

RSpec.describe PlaylistsController, type: :controller do
    before :each do
       post :index
    end
    describe 'when logged in' do
        it 'should render playlists/index view' do
            expect(User).to redirect_to(playlists_index_url)
        end
    end
end
