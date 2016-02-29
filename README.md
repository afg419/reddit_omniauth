##Reddit Omniauth

#### Summary

Reddit Omniauth is a first deep dive into AJAX, API's, and OAUTH.  It allows a user to login via Reddit's Oauth protocol, then return subreddit posts along with some basic data, and the users private messages.  When a user clicks a subreddit and filter from the top two navbars, an AJAX request is sent to the Reddit API, and returns with the requested data.  Similarly, users on the app can vote on the returned posts from the Reddit API, again with AJAX post requests.  Finally, the app implements some elementary caching in the 'r/all' subreddits: it uses background workers to hit the reddit API every 15 seconds, stores the responses in a local database, and then serves that information back to AJAX requests from 'r/all' filter pages in the app.    

To run Reddit Omniauth locally, first clone this repo and bundle:  

`$ git clone https://github.com/afg419/reddit_omniauth.git`  
`$ bundle`    

Create and seed local database:  
`$ rake db:create && rake db:migrate && rake db:seed`    

Run the server at url `localhost:3000` locally with:  
`$ rails server`    

To initialize background workers:
`$ clockwork app/background_workers/clock.rb`

Run development/test tests with:  
`$ rake test`





