require 'rails_helper'
require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do

# Allow private and protected methods to undergo unit testing by temporarily
# redefinng as public
#class ApplicationController
  #public :set_current_user
#end

    describe "#set_current_user" do
=begin
        before :each do
            @controller = ApplicationController.new
            session[:session_token] = "369kgallRNfV0d1S5e4aKA"
        end
        it "should set session token of user" do
            @controller.instance_eval{ set_current_user }   # invoke the private method
            byebug
            @controller.instance_eval{ @current_user[:session_token] }.should eq("369kgallRNfV0d1S5e4aKA")
            #expect(@current_user.session_token).to eq("369kgallRNfV0d1S5e4aKA")
        end
=end
    end
end
