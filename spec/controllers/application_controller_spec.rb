require 'rails_helper'
require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do

# Allow private and protected methods to undergo unit testing by temporarily
# redefinng as public
class ApplicationController
  public :set_current_user
end

    describe "#set_current_user" do
        before :each do
          @auth={ :email =>'myEmail', :display_name => 'myDisplayName', :id => "123123"}
          @auth_user = RSpotify::User.new(@auth)
          @user = User.create_with_omniauth(@auth_user)
          puts "user is: #{@user}"
          puts "user.session_token #{@user.session_token}"

          @user.save

            #@user = {:session_token => "369kgallRNfV0d1S5e4aKA"}
        end
        it "should set session token of user" do
            expect(subject.set_current_user).to eq("123")
        end
    end
end
