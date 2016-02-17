class User < ActiveRecord::Base
  def self.find_or_create_by_auth(reply)
    user = User.find_or_create_by(name: reply["name"])
    user.refresh_token = reply["refresh_token"]
    user.link_karma = reply["link_karma"]
    user.comment_karma = reply["comment_karma"]
    user.reddit_id = reply["id"]
    user.inbox_count = reply["inbox_count"]
    user.gold_creddits = reply["gold_creddits"]
    user.save
    user
  end
end
