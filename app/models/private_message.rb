class PrivateMessage

  def self.reddit_service
    RedditService.new
  end

  def self.all(mail_box, access_token)
    messages = JSON.parse(reddit_service.get(url: "https://oauth.reddit.com/",
                                              path: "message/#{mail_box}",
                                            token: access_token))

    messages["data"]["children"].map do |message_json|
      build_message(message_json["data"])
    end
  end

private

  def self.build_message(message_params)
    OpenStruct.new(message_params)
  end

end
