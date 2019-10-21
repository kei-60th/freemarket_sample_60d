class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @omniauth = request.env['omniauth.auth']
    info = User.find_oauth(@omniauth)
    @user = info[:user]
    @sns = info[:sns]

    if @user.persisted? #snsが存在したら
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else #snsが存在しなかったら
      session["devise.sns_uid"] = @sns[:uid]
      render template: "users/registrations/new"
    end
  end

  def failure
    redirect_to root_path and return
  end
end