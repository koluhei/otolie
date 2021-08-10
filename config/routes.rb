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
  resources :users, only: [:index, :show] do
    collection do
      get 'search'
    end
  end
  resources :creators, only: [:index, :show] do
    resources :plans, except: :show do
      resources :orders, only: [:index, :create]
    end
    collection do
      get 'search'
    end
  end
  resources :chats, only: [:index, :create] do
    resources :messages, only: [:index, :create] 
  end
end
