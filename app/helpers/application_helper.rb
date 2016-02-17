module ApplicationHelper
  def login_or_logout_link
    if current_user
      link_to "Logout", '/logout', method: :delete
    else
      s = rand(0..10000)
      link_to "Login with Reddit", "https://www.reddit.com/api/v1/authorize?client_id=_wQqSTYHc9pGZQ&response_type=code&state=#{s}&redirect_uri=http://localhost:3000/reddit/auth&duration=permanent&scope=identity edit flair history modconfig modflair modlog modposts modwiki mysubreddits privatemessages read report save submit subscribe vote wikiedit wikiread"
    end
  end

end
