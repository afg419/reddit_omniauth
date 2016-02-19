class Api::PostsController < ApplicationController
  def index
    unless params[:subreddit] == "render"
      session[:selected_subreddit] = params[:subreddit]
      session[:selected_filter] = params[:filter_by]
    end

    if selected_subreddit == "all"
      reply = Cache.last.send(selected_filter)
    end

    render json: reply
  end

  def update
    if current_user
      post_id = params["post_id"]
      update_vote_history(post_id, params["vote_count"].to_i)
      vote_count = voting_history[post_id]

      request_body = "dir=#{vote_count}&id=t3_#{post_id}&rank=6"
      reply = reddit_service.post(path: "vote", post_body: request_body, token: current_access_token)
    end

    render json: voting_history
  end

  def color
    render json: voting_history
  end

  private

  def update_vote_history(post_id, vote_count)
    if voting_history[post_id] == vote_count
      voting_history[post_id] = 0
    else
      voting_history[post_id] = vote_count
    end
  end
end
