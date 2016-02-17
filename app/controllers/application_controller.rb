class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,
                :current_username,
                :user_info_from_api,
                :reddit_service,
                :current_access_token

  def reddit_service
    @service ||= RedditService.new
  end

  def current_user
    @current_user ||= User.find_by(name: session[:name]) if session[:name]
  end

  def current_access_token
    session[:user_token]
  end

  def user_info_from_api
    if current_access_token
      JSON.parse(reddit_service.get(path: "me", token: current_access_token))
    end
  end
end
