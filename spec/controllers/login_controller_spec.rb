=begin
require 'rails_helper'
require 'spec_helper'

RSpec.describe LoginController, type: :controller do
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
end
=end