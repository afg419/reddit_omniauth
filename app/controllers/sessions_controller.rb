class SessionsController < ApplicationController
  def create
    binding.pry
    if params["code"]
      reply = JSON.parse(reddit_service.o_authenticate_with_reddit(params["code"]))
      if session[:user_token] = reply["access_token"]
        user = User.find_or_create_by_auth(user_info_from_api.merge(reply))
        session[:name] = user.name
        flash[:notification] = "Successfully logged in!"
      else
        flash[:error] = "Issue with Logging In."
      end
    else
      flash[:error] = params["Error"]
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
