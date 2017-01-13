module InstagramHelper
  def stub_instagram_recent_media
    stub_request(:get, "https://api.instagram.com/v1/users/self/media/recent.json")
      .with(query: {access_token: '123'})
      .to_return(:status => 200, body: file_fixture('user_media_recent.json').read)
  end
end