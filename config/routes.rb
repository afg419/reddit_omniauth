Rails.application.routes.draw do
  root 'home#show'
  get '/reddit/auth', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
