require 'rspotify/oauth'
require 'omniauth-google-oauth2'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '180509d7204c47ebbc519f8d8e2b5cb0', 'e52ac4d2cb694b889716ecd7efa43faa', scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
  #provider :google_oauth2, ENV['1095677510377-98krukjir1j472p4q3g7gb18oej274t2.apps.googleusercontent.com'], ENV['4UQ2tXPd9fIaUrOLuNdS9lEl'], {:scope => "email, profile, http://gdata.youtube.com"}
  provider :google_oauth2, '1095677510377-98krukjir1j472p4q3g7gb18oej274t2.apps.googleusercontent.com', '4UQ2tXPd9fIaUrOLuNdS9lEl',
           {:scope => 'email, profile, plus.me, http://gdata.youtube.com, https://www.googleapis.com/auth/youtube.upload, https://www.googleapis.com/auth/youtube'}
end
