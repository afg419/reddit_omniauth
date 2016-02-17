class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,
                :current_username,
                :user_info_from_api,
                :reddit_service

  def reddit_service
    @service ||= RedditService.new
  end

  def current_user
    @current_user ||= User.find_by(token: session[:user_token]) if session[:user_token]
  end

  def user_info_from_api
    JSON.parse(reddit_service.get(path: "me", token: session[:user_token])) if session[:user_token]
  end
end
