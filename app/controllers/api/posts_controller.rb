class Api::PostsController < ApplicationController
  def index
    subreddit = params[:subreddit]
    filter_by = params[:filter_by]

    reply = Post.all_unauth(subreddit, filter_by)

    render json: reply
  end
end
