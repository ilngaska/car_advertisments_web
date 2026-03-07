# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :cars, only: [:index]
  resources :searches, only: [:index]
  resources :help, only: [:index]
end
