Rails.application.routes.draw do
  root 'home#index'
  get '/reddit/auth', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :private_messages, only: [:index, :new, :create]

  namespace 'api', path: '/api/v1' do
    get '/posts/r/:subreddit/:filter_by', to: 'posts#index'
    get '/vote/:post_id/:vote_count', to: 'posts#update'
  end
end

#add upvote and downvote links, send ajax requests to reddit with up and downvotes.  should
# update your page with some new css stuff.  If we refresh the new arrow color stays.
#POST /api/votevote
