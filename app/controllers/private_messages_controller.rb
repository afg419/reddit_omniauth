class PrivateMessagesController < ApplicationController
  def index
    @messages = PrivateMessage.all("inbox", current_access_token)
  end
end
