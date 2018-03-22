Rails.application.routes.draw do
  root to: 'home#index'
  resources :beers, only:[:index] do
    get 'search', on: :collection
  end
end
