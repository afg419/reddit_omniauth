class PostService

  attr_reader :reddit_service

  def initialize
    @reddit_service = RedditService.new
  end

  def posts(subreddit, token, filter_by = "top")
    posts = JSON.parse(reddit_service.get(url: "https://oauth.reddit.com/",
                             path: "r/#{subreddit}/#{filter_by}",
                            token: current_access_token))
    posts["data"]["children"]
  end

  def unauth_posts(subreddit, filter_by)
    posts = JSON.parse(reddit_service.unauth_get_json(path: "r/#{subreddit}/#{filter_by}/"))
    posts["data"]["children"]
  end
end
