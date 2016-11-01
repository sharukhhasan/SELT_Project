require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
    context 'when logged in' do
        it { is_expected.to respond_with 200 }
    end
    context 'when logged out' do
        it { is_expected.to respond_with 401 }
    end
end