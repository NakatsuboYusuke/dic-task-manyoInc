class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include ErrorHandler #if Rails.env.production? #=> move or not move

  helper_method :current_user
  before_action :basic
  before_action :login_required
  before_action :login_forbided

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
    raise Forbidden if current_user
  end

end
