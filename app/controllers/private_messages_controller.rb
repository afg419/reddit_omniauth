class PrivateMessagesController < ApplicationController
  def index
    if params[:mail]
      @messages = PrivateMessage.all(params[:mail], current_access_token)
      respond_to do |format|
        format.js
      end
    else
      @messages = PrivateMessage.all("inbox", current_access_token)
      @from_log_in_nav = true
    end
  end
end
