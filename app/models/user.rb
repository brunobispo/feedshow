class User < ApplicationRecord
  devise :database_authenticatable,
         :omniauthable, :omniauth_providers => [:instagram]

  def pictures
    instagram_client.user_recent_media
  end

  protected

  def instagram_client
    Instagram::Client.new access_token: instagram_access_token
  end
end
