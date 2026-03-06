# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get    'login',  to: 'sessions#new',     as: :login
  post   'login',  to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout

  get    'signup', to: 'users#new',        as: :signup
  post   'signup', to: 'users#create'

  resources :cars, only: [:index] do
    get 'search', on: :collection, as: :search
  end

  get 'history', to: 'pages#history', as: :history
  get 'help',    to: 'pages#help',    as: :help
end