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
    it 'should set user.name to auth.display_name if auth.display_name is not == nil' do
        user = User.new(name: "1234")
        expect(user.name).to eq("1234")
    end
=begin
t.string   "provider"
t.string   "uid"
t.string   "name"
t.string   "session_token"
t.datetime "created_at",    null: false
t.datetime "updated_at",    null: false
=end
end