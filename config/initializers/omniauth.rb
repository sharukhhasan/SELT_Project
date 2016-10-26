Rails.application.config.middleware.use OmniAuth::Builder do |config|
  provider :spotify, ENV['180509d7204c47ebbc519f8d8e2b5cb0'], ENV['e52ac4d2cb694b889716ecd7efa43faa'], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end