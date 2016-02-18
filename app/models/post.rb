class Post

  def self.reddit_service
    RedditService.new
  end

  def self.all(subreddit, filter_by, access_token)
    posts = JSON.parse(reddit_service.get(url: "https://oauth.reddit.com/",
                             path: "r/#{subreddit}/#{filter_by}",
                            token: access_token))
    posts["data"]["children"].map do |post_json|
      build_post(post_json["data"])
    end
  end

  def self.all_unauth(subreddit, filter_by)
    posts = JSON.parse(reddit_service.unauth_get_json(path: "r/#{subreddit}/#{filter_by}/"))
    posts["data"]["children"].map do |post_json|
      build_post(post_json["data"])
    end
  end

private

  def self.build_post(post_params)
    OpenStruct.new(post_params)
  end
end
