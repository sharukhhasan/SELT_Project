require 'rails_helper'
require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do
    
    
    describe "current user session established" do
        #before :each do
            #post :set_current_user
        #end
        it "should have a current_user" do
            # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
            current_user = User.find_by_session_token("1")
            expect(@current_user).to_not eq(nil)
            expect(session[:session_token]).to_not eq(nil)
        end
    end
end
=begin
    #post :search_tmdb, {:search_box => 'Ted'}
    context 'when logged in' do
        it { is_expected.to respond_with 200 }
    end
    context 'when logged out' do
        it { is_expected.to respond_with 401 }
    end
    
    #before :each do
        #post :search_tmdb, {:search_box => ''}
    #end
    describe 'Successful Logging in to Spotitude' do     
        it 'should call the model method that authenticates the user' do
            result = false
            expect(result).to be_truthy
        end
        it 'should redirect the user to their playlist' do
            expect(User).to redirect_to(playlist_path)
        end
        it 'should validate the users email' do
            result = false
            expect(result).to be_truthy
        end
    end
    
    #before :each do
        #@results = {:tmdb_id => 603, :title => "The Matrix", :rating => "R", :release_date => "1999-03-30"}
    #end
    describe 'Unsuccessful Logging in to Spotitude' do     
        it 'should call the model method that authenticates the user' do 
            result = false
            expect(result).to be_truthy
        end
        it 'should redirect to login page' do
            expect(User).to redirect_to(new_login_path)
        end
        it 'should display an error message' do
            result = false
            expect(result).to be_truthy
        end
    end 
=end
