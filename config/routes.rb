Rails.application.routes.draw do
  root to: 'home#index'

  resources :beers, only: [:show] do
    get 'search', on: :collection
  end

  resources :school_beers, only: [:show] do
    get 'search', on: :collection
  end

  resources :bar, only: [:show]
end
