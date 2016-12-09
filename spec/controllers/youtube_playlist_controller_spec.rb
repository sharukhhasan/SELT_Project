require 'rails_helper'

RSpec.describe YoutubePlaylistController, type: :controller do

  describe '#config_yt_gem' do
    it 'should configure the yt_gem' do
      subject.config_yt_gem
      cid = Yt.configuration.client_id.should eq('1095677510377-98krukjir1j472p4q3g7gb18oej274t2.apps.googleusercontent.com')
      cs  =     Yt.configuration.client_secret === '4UQ2tXPd9fIaUrOLuNdS9lE'
      ck =     Yt.configuration.api_key === 'AIzaSyDl03kJVnB5b62LjXXnPgWKCoG_F4c5uyU'
      result = cid and cs and ck
      expect(result).to eq(true)
    end
  end

end

