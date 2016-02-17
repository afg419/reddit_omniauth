class RedditService
  def get(url: "https://oauth.reddit.com/api/v1/", path: path, token: token)
    uri = URI(url + path + "/")
    req = Net::HTTP::Get.new(uri, "Authorization" => "bearer #{token}")
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") {|http|
      http.request(req)
    }
    res.body
  end

  def unauth_get_json(url: "http://www.reddit.com/.json")
    uri = URI(url)
    req = Net::HTTP::Get.new(uri)
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }
    res.body
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
end
