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
end
