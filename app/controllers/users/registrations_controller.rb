# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'registration'
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    if user_params[:password] == "" #sns登録なら
      user_params.merge(password: Devise.friendly_token.first(6)) #deviseのパスワード自動生成機能を使用
      user_params.merge(password_confirmation: Devise.friendly_token.first(6))
      #super
      @user = User.new(user_params)
      sns = SnsCredential.update(user_id:  @user.id)
    else #email登録なら
      #super
      @user = User.new(user_params)
    end
    password = Devise.friendly_token.first(8)
    @user.password = password
    @user.password_confirmation = password
    if @user.save
      redirect_to registration_address_path
    else
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  private

  def user_params
    params.require(:user)
    .permit(:email,
            :password,
            :password_confirmation,
            :nickname,
            :first_name,
            :last_name,
            :first_name_kana, 
            :last_name_kana,
            :birth_year, 
            :birth_month, 
            :birth_day, 
    ).merge(birth_year: params[:birth_year],birth_month: params[:birth_month],birth_day: params[:birth_day])
  end










end
