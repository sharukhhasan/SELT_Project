require 'rails_helper'
require 'spec_helper'


RSpec.describe UsersController, type: :controller do
  before :each do
    get :settings
  end
    describe "Pulling all the info from the spotify user" do
      it "should get the user" do
        expect(response).to render_template(:settings)
      end
    end
end

