class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :basic
  before_action :login_required
  before_action :login_forbided

  class Forbidden < ActionController::ActionControllerError; end
  rescue_from Forbidden, with: :rescue403
  def rescue403(e)
    @exception = e
    render 'errors/forbidden', status: 403
  end

  private

  def basic
    if Rails.env == "production"
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login_required
    redirect_to login_path unless current_user
  end

  def login_forbided
    redirect_to tasks_path if current_user
  end

end
