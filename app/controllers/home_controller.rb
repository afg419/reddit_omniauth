class HomeController < ApplicationController
  def index
    if current_user
      @all = Post.all(selected_subreddit, selected_filter, current_access_token)
    else
      @all = Post.all_unauth(selected_subreddit, selected_filter)
    end
  end
end
