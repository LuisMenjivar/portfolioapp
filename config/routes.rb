Rails.application.routes.draw do
  resources :wikies do 
    resources :collaborations
  end
  devise_for :users
  root 'home#index'
  resources :todos, except: [:show]
  get 'privatewikies' => 'wikies#privatewikies'
  get 'search_results' => 'wikies#search_results', as: 'search_results'
  resources :charges, only: [:new, :create]
  get 'topics/home' => 'topics#home'
  resources :topics do 
    resources :bookmarks, except: [:index], controller: 'topics/bookmarks'
  end
  resources :bookmarks, only: [:index]
end 