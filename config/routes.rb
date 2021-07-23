Rails.application.routes.draw do
  devise_for :creators
  devise_for :users
  root to: "songs#index"
  resources :songs, only: [:index, :new, :create]
end
