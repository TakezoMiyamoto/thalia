class UsersController < ApplicationController

  before_action :authenticate_user!, only:[:create, :edit, :update, :destroy]
  before_action :set_user, only:[:show, :edit, :update]
  def index
    @user = User.all
  end

  def show
    @userName = @user.username

  end

  def edit

  end

  def update
    if @user.errors[:base].empty? and @user.update(edit_user_params)
      sign_in(@user, :bypass => true)
      flash[:success] = "プロフィールは更新されました"
      redirect_to @user
    else
      flash[:danger] = "プロフィールの更新に失敗しました"
      redirect_to user_path(current_user.id)
    end
  end

  private

  def edit_user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
