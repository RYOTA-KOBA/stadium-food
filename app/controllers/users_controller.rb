class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "プロフィールを更新しました"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
