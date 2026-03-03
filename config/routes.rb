Rails.application.routes.draw do
  root "home#index"
  
  resources :cars, only: [:index, :show] do
    collection do
      get 'search'
    end
  end
end