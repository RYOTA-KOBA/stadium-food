# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    super
    #ユーザーが無事に作られていたらprofileを作成
    if resource
      #resource==user
      profile = Profile.new
      profile.user_id = resource.id
      profile.name = params[:profile][:name]
      profile.save
    end 
    puts "===============#{params[:profile][:name]}================="
    
  end

  def edit
    @user = User.find(params[:id])
  end

  # def update
  #   @user = User.find(params[:id])

  #   if @user.update(user_params)
  #     flash[:success] = "プロフィールを更新しました"
  #     redirect_to user_path
  #   else
  #     render user_edit_path
  #   end
  # end

  # private

  #   def user_params
  #     params.require(:user).permit(:name, :email, :password,:password_confirmation)
  #   end

  
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # def profile_edit
 
  # end

  # def profile_update
  #   current_user.assign_attributes(account_update_params)
  #   if current_user.save
	#   redirect_to my_page_path, notice: 'プロフィールを更新しました'
  #   else
  #     render "profile_edit"
  #   end
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
  #   post_path
  # end

  

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
