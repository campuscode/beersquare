Rails.application.routes.draw do
  root to: 'home#index'
  resources :beers, only:[:index, :show] do
    get 'search', on: :collection
  end

  resources :bar, only:[:show]

end
