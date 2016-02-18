class Api::PostsController < ApplicationController
  def index
    session[:selected_subreddit] = params[:subreddit]
    session[:selected_filter] = params[:filter_by]

    if current_user
      reply = Post.all(selected_subreddit, selected_filter, current_access_token)
    else
      reply = Post.all_unauth(selected_subreddit, selected_filter)
    end

    render json: reply
  end

  def update
    post_id = "t3_" + params["post_id"]
    vote_count = params["vote_count"].to_i
    post_body = "dir=#{vote_count}&id=#{post_id}&rank=6"

    unparsed = reddit_service.post(path: "vote", post_body: post_body, token: current_access_token)
    reply = JSON.parse(unparsed)

    render json: reply
  end
end
