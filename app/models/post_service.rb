class PostService

  attr_reader :reddit_service

  def initialize
    @reddit_service = RedditService.new
  end

  def posts(subreddit, filter_by = "top")
    JSON.parse(reddit_service.get(url: "https://oauth.reddit.com/",
                             path: "r/#{subreddit}/#{filter_by}",
                            token: current_access_token))
  end

  def unauth_posts(subreddit, filter_by)
    posts = JSON.parse(reddit_service.unauth_get_json(path: "r/#{subreddit}/#{filter_by}/"))
    posts["data"]["children"]
  end
end
