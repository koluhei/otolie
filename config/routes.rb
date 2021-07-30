Rails.application.routes.draw do
  devise_for :creators
  devise_for :users
  root to: "songs#index"
  resources :songs do
    resources :dls, only: [:index]
  end
  resources :creators, only: [:show]
  resources :users, only: [:show]
end
