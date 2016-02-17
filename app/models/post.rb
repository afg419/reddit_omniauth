class Post

  def self.service
    PostService.new
  end

  def self.all(subreddit, filter_by)
    service.posts(subreddit, filter_by)
  end

  def self.all_unauth(subreddit, filter_by = "top")
    service.unauth_posts(subreddit, filter_by).map do |post_json|
      build_post(post_json["data"])
    end
  end


private

  def self.build_post(post_params)
    OpenStruct.new(post_params)
  end

end
