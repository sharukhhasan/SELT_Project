require 'rails_helper'
require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do

  # Allow private and protected methods to undergo unit testing by temporarily
  # redefinng as public
  class ApplicationController
    public :set_current_user
  end

  describe ApplicationController do
      # it 'should call the model method, find_by_session_token' do # todo: fix this test...
      #   expect(subject.set_current_user).to exist
      # end
  end
end
