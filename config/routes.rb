Rails.application.routes.draw do
  root 'store#index'

  get '/store', to: 'store#index'
  get '/store/:id', to: 'store#show'
  get '/store/new', to: 'store#new'
  post '/store', to: 'store#create'
  get '/store/:id/edit', to: 'store#edit'
  patch '/store/:id', to: 'store#update'
  delete '/store/:id', to: 'store#destroy'
end
