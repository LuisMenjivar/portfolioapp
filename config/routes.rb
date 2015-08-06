Rails.application.routes.draw do
  resources :wikies
  devise_for :users
  root 'home#index'
  resources :todos, except: [:show]
  get 'privatewikies' => 'wikies#privatewikies'
end 