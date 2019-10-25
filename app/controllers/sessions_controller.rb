class SessionsController < ApplicationController

  skip_before_action :login_required
  skip_before_action :login_forbided

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
