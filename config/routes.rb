Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :edit, :update]
  root to: 'pages#home'
  resources :jobs do
    resources :requests, only: [:new, :create]
  end
  resources :requests, only: [:index] do
    member do
      patch :confirm
      patch :deny
      patch :cancel
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
