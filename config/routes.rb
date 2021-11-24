# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :boards
  get '/payments/success', to: 'payments#success'
  get '/payments/cancel', to: 'pages#index'
  root 'pages#index'
end
