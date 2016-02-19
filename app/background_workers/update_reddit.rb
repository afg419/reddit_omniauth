require_relative '../models/cache.rb'

class UpdateReddit
  def initialize
    Cache.create(make_api_calls)
    if Cache.count == 2
      Cache.first.destroy
    end
  end

  def make_api_calls
    {
      top: Post.all_unauth("all", "top"),
      new: Post.all_unauth("all", "new"),
      rising: Post.all_unauth("all", "rising"),
      controversial: Post.all_unauth("all", "controversial"),
      hot: Post.all_unauth("all", "hot"),
      gilded: Post.all_unauth("all", "gilded")
    }
  end
end
