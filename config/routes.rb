# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :cars, only: [:index]
  get 'search', to: 'cars#search', as: :search_cars
  get 'help', to: 'pages#help', as: :help
end
