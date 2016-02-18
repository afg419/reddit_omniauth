class HomeController < ApplicationController
  def index
    if current_user
      @all = Post.all(selected_subreddit, selected_filter, current_access_token)
    else
      @all = Post.all_unauth(selected_subreddit, selected_filter)
    end
  end
end

# session => "52329580-SVlzbdAk6uMw6WkMXS2b2CBPDOk"
# user => "52329580-n-rptBNZJdaYH3hRjiElfPYKKFY"

# session => "52329580-Eca8_VERJZecaP9fewWbP7B7hYw"
# user =>"52329580-8fsjIy4UVrxoIY2xkT5bpdm21d0"
