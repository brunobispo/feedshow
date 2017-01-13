class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def instagram
    user = User
      .where(instagram_id: request.env["omniauth.auth"].uid)
      .first_or_initialize

    user.update(instagram_access_token: request.env["omniauth.auth"].credentials.token)

    sign_in_and_redirect user, event: :authentication
    flash.notice = t('successfully_authenticated') if is_navigational_format?
  end

  def failure
    redirect_to new_user_session_path
    flash.alert = t('could_not_authenticate') if is_navigational_format?
  end

end