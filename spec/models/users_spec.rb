describe User do
  
  describe 'Validations'
    it "is valid with valid attributes" do
      expect(User.new).to be_valid
    end
    it "is not valid without a provider" do
      user = User.new(provider: nil)
      expect(user).to be_valid
    end
    it "is not valid without an uid" do
      user = User.new(uid: nil)
      expect(user).to be_valid
    end
    it "is not valid without a name" do
      user = User.new(name: nil)
      expect(user).to be_valid
    end
    it "is not valid without a session_token" do
      user = User.new(session_token: nil)
      expect(user).to be_valid
    end
    it "is not valid without a created_at" do
      user = User.new(created_at: nil)
      expect(user).to be_valid
    end
    it "is not valid without an updated_at" do
      user = User.new(updated_at: nil)
      expect(user).to be_valid
    end
  
  describe 'creating with omniauth(@test)'
    it "#create_with_omniauth(auth)" do
      
    end
=begin 
  describe 'auth display name'
    it "should make user.name = auth.email if auth.display_name == nil" do
      expect(User.name).to eq(auth.email)
    end
    it "should make user.name = auth.display_name if auth.display_name != nil" do
      expect(User.name).to eq(auth.display_name)
    end
    it "should validate that user.uid = auth.id" do
      expect(User[:uid]).to eq(auth.id)
    end
=end

=begin
t.string   "provider"
t.string   "uid"
t.string   "name"
t.string   "session_token"
t.datetime "created_at",    null: false
t.datetime "updated_at",    null: false
=end
end