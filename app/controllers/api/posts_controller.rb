class Api::PostsController < ApplicationController
  def index
    subreddit = params[:subreddit]
    filter_by = params[:filter_by]

    if current_user
      reply = Post.all(subreddit, filter_by, current_access_token)
    else
      reply = Post.all_unauth(subreddit, filter_by)
    end

    render json: reply
  end
end
