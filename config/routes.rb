Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :beers, only: [:show] do
    get 'search', on: :collection
  end

  resources :school_beers, only: [:show] do
    get 'search', on: :collection
  end

  resources :bars, only:[:index, :show] do
    resources :checkins, only: [:create, :edit, :update]
  end

  resources :profiles, only:[:show, :update, :edit]
end
