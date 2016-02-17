class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :get, :post, :o_authenticate_with_reddit, :current_user

  def get(url: "https://www.reddit.com/api/v1/", path: path)
    uri = URI(url + path + "/")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def o_authenticate_with_reddit(code)
    uri = URI('https://www.reddit.com/api/v1/access_token')
    req = Net::HTTP::Post.new(uri)
    req.basic_auth ENV["app_id"], ENV["reddit_secret_key"]
    req.body = "grant_type=authorization_code&code=#{code}&redirect_uri=http://localhost:3000/reddit/auth"

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") {|http|
      http.request(req)
    }
    res.body
  end

  def current_user
    @current_user ||= User.find_by(token: session[:user_token]) if session[:user_token]
  end
end
