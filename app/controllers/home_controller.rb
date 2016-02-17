class HomeController < ApplicationController
  def show
    if current_user
      @all = JSON.parse(reddit_service.get(url: "https://oauth.reddit.com/",
                               path: 'r/all/top',
                              token: current_user.token))
    else
      @all = JSON.parse(reddit_service.unauth_get_json)
    end
  end
end
