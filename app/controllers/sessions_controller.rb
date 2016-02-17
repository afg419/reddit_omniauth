class SessionsController < ApplicationController
  def create
    if params["code"]
      reply = JSON.parse(o_authenticate_with_reddit(params["code"]))
      if session[:user_token] = reply["access_token"]
        User.find_or_create_by_auth(user_info_from_api.merge(reply))
        flash[:notification] = "Successfully logged in!"
        redirect_to root_path
      else
        flash[:error] = "Issue with Logging In."
        redirect_to root_path
      end
    else
      flash[:error] = params["error"]
      redirect_to root_path
    end
  end


  # {"access_token"=>"52329580-ZsuYfh6N0osPtqeIdnG8Lk5oeII",
  #  "token_type"=>"bearer",
  #  "expires_in"=>3600,
  #  "refresh_token"=>"52329580-6XXPOtIqVQJ1MmDMPkAIVrReeFQ",
  #  "scope"=>"flair history identity read"}


  # {"access_token"=>"52329580-1ycK1C8LWbtoAbMSP--aMt3bA3I",
  #  "token_type"=>"bearer",
  #  "expires_in"=>3600,
  #  "refresh_token"=>"52329580-x1vQrrWOMn8-R0e_e3hqmna_b1Q",
  #  "scope"=>
  #   "edit
  #   flair
  #   history
  #   identity
  #   modconfig
  #   modflair
  #   modlog
  #   modposts
  #   modwiki
  #   mysubreddits
  #   privatemessages
  #   read
  #   report
  #   save
  #   submit
  #   subscribe
  #   vote
  #   wikiedit
  #   wikiread"}

  # def create
  #   @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
  #
  #   if @user
  #     session[:user_id] = @user.id
  #     redirect_to dashboard_path
  #   else
  #     redirect_to root_path
  #   end
  #if there is already a user in the db with a given uid (request.env["omniauth.auth"]["uid"])
  #fetch the existing user, otherwise create a new one.

  #if we have a user/the login was successful, redirect to dashboard path (user show)
  #else redirect to root path
end
