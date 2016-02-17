class HomeController < ApplicationController
  before_action :subreddit_all

  def subreddit_all
    @sub = "all"
  end

  def index
    if current_user
      @all = Post.all("all", "top", current_access_token)
    else
      @all = Post.all_unauth("all", "top")
    end
  end
end

# session => "52329580-SVlzbdAk6uMw6WkMXS2b2CBPDOk"
# user => "52329580-n-rptBNZJdaYH3hRjiElfPYKKFY"

# session => "52329580-Eca8_VERJZecaP9fewWbP7B7hYw"
# user =>"52329580-8fsjIy4UVrxoIY2xkT5bpdm21d0"
