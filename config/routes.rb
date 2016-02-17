Rails.application.routes.draw do
  root 'home#index'
  get '/reddit/auth', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :private_messages, only: [:index, :new, :create]
end
