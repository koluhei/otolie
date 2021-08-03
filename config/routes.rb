Rails.application.routes.draw do
  devise_for :creators
  devise_for :users

  root to: "songs#index"

  resources :songs do
    resources :dls, only: [:index, :create] do
      collection do
        get 'download_page'
        get 'download'
      end
    end
  end  
  resources :users, only: [:show]
  resources :creators, only: [:show] do
    resources :plans, only: [:index]
  end
end
