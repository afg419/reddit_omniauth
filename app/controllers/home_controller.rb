class HomeController < ApplicationController
  before_action :subreddit_all

  def subreddit_all
    @sub = "all"
  end

  def show
    if current_user
      @all = JSON.parse(reddit_service.get(url: "https://oauth.reddit.com/",
                               path: "r/#{subreddit_all}/top",
                              token: current_user.token))
    else
      @all = JSON.parse(reddit_service.unauth_get_json)
    end
  end
end
