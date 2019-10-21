class ApplicationController < ActionController::Base

  before_action :basic

  private

  def basic
    name = 'hoge'
    passwd = 'e86797b125848e625d70987c20e4127bbb3db51a'
    authenticate_or_request_with_http_basic('BA') do |n, p|
      n == name && Digest::SHA1.hexdigest(p) == passwd
    end
  end

end
