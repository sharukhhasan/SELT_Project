describe User do

  #before :each do
    #post :create_session_token
  #end
  context 'session token' do
    it 'should create a new session token' do
        expect(@session_token).to be_a( SecureRandom.urlsafe_base64)
    end
  end
end