Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"

    get "/signup", to: "users#new"
    post "/signup", to: "users#create"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"

    get "/logout", to: "sessions#destroy"

    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :account_activations, only: :edit
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :microposts, only: [:index, :show, :create, :destroy]
    resources :relationships, only: [:create, :destroy]
    resources :groups, only: [:index, :show, :create, :destroy]
    resources :group_users, only: [:create]
    resources :comments, only: [:create, :destroy]
  end
end
