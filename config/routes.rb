# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :cars, only: [:index]

  get 'login', to: 'pages#login', as: :login
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'history', to: 'pages#history', as: :history
  get 'search', to: 'cars#search', as: :search_cars
  get 'help', to: 'pages#help', as: :help
end
