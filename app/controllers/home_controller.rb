class HomeController < ApplicationController
  def show
    if current_user
      @all = JSON.parse(reddit_service.get(url: "https://oauth.reddit.com/",
                               path: 'r/all/top',
                              token: current_user.token))
    end
  end
end

# GET [/r/subreddit]/api/flairlist
