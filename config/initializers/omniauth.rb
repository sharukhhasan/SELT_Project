require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '180509d7204c47ebbc519f8d8e2b5cb0', 'e52ac4d2cb694b889716ecd7efa43faa', scope: 'user-read-email playlists-modify-public user-library-read user-library-modify'
end