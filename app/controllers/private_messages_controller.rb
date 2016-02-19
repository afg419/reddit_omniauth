class PrivateMessagesController < ApplicationController
  def index
    session[:mail] = params[:mail]
    if selected_mailbox
      @messages = PrivateMessage.all(selected_mailbox, current_access_token)
      respond_to do |format|
        format.js
      end
    else
      @messages = PrivateMessage.all("inbox", current_access_token)
    end
  end
end
