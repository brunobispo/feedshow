module OmniauthHelper
  def mock_omniauth
    OmniAuth.config.test_mode = true
  end

  def mock_authorized_instagram
    mock_omniauth
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new(
      id: '12345', username: 'bbispo', full_name: 'Bruno Bispo',
      credentials: {token: '123'}
    )
  end

  def mock_unauthorized_instagram
    mock_omniauth
    OmniAuth.config.mock_auth[:instagram] = :invalid_credentials
  end
end