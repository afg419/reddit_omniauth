class PrivateMessagesController < ApplicationController

  def show
    @messages = JSON.parse(reddit_service.get(url: "https://oauth.reddit.com/",
                                             path: "message/inbox",
                                            token: current_access_token))
  end

end
