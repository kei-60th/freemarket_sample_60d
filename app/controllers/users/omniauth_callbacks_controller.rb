class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook) #コールバック
  end

  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"]) #usersモデルのメソッド
    @user = info[:user]
    sns_id = info[:sns_id]
    # binding.pry
    if @user.persisted? #userが存在したら
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else #userが存在しなかったら
      session["devise.sns_id"] = sns_id #sns_credentialのid devise.他のアクションに持ち越せる(少し難)
      render template: "devise/registrations/new"　#redirect_to だと更新してしまうのでrenderで
    end
  end

  def failure
    redirect_to root_path, alert: 'Facebook認証に失敗しました。'
  end
end
