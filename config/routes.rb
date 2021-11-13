Rails.application.routes.draw do
  
  devise_for :users
  resources :boards

  root 'pages#index'

  # get '/store', to: 'store#index'
  # post '/store/create', to: 'store#create'
  # get '/store/new', to: 'store#new'
  # get '/store/:id', to: 'store#show'
  # get '/store/:id/edit', to: 'store#edit'
  # patch '/store/:id', to: 'store#update'
  # delete '/store/:id', to: 'store#destroy'
end
