# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]

  get 'logout', to: 'sessions#destroy', as: :logout

  resources :cars, only: [:index]
  resources :searches, only: [:index]
  resources :search_histories, only: [:index]
  resources :help, only: [:index]

  namespace :admin do
    resources :car_advertisements
  end
end
