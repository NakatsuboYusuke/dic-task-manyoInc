class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user?, only: [:edit, :create, :update]
  skip_before_action :login_required, only: [:new, :create]
  skip_before_action :login_forbided

  def index
    @users = User.all
  end

  def show
    redirect_to tasks_path unless current_user.id == @user.id
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "ユーザ「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザ「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice: "ユーザ「#{@user.name}」を削除しました。"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def current_user?
    @user = User.find(params[:id])
    redirect_to user_path(@user.id) unless @user.id == current_user.id
  end

end
