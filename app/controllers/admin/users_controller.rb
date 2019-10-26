class Admin::UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin
  skip_before_action :login_required, only: [:new, :create]
  skip_before_action :login_forbided

  def index
    @users = User.all
  end

  def show
    @tasks = @user.tasks.recent
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user.id), notice: "ユーザ「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: "ユーザ「#{@user.name}」を更新しました。"
    else
      redirect_to admin_users_path, notice: "少なくとも一つの管理者アカウントが必要です。"
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」を削除しました。"
    else
      redirect_to admin_users_path, notice: "少なくとも一つの管理者アカウントが必要です。"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def require_admin
    raise Forbidden unless current_user.admin?
  end

end
