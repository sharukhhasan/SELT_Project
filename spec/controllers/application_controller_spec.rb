require 'rails_helper'
require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do

    describe "#set_current_user" do
        before :each do
            @user = {:session_token => "369kgallRNfV0d1S5e4aKA"}
        end
        it "should set session token of user" do
            expect(subject.set_current_user).to eq("369kgallRNfV0d1S5e4aKA")
        end
    end
end