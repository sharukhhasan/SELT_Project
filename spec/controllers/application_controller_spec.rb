require 'rails_helper'
require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do

# Allow private and protected methods to undergo unit testing by temporarily
# redefinng as public
class ApplicationController
  public :set_current_user
end

    describe "#set_current_user" do
        it "should set session token of user" do
          User.stub(:find_by_session_token).and_return("atoken")
          expect(subject.set_current_user).to eq("atoken")
        end
    end
end
