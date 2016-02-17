Rails.application.routes.draw do
  root 'home#show'
  get '/reddit/auth', to: 'sessions#create'
end
