Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'boards#index'
  resources :boards do
    resources :tasks do
      resources :comments, only: [:new, :create]
    end
  end
  resource :timeline, only: [:show]

  devise_for :users
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  resource :profile, only: [:show, :edit, :update]

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  mount ActionText::Engine, at: "/action_text"
end
