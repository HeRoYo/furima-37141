Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :purchases, only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
