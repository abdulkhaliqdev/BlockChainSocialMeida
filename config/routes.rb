Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  devise_for :users

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :blogs, only: %i[index] do
        resources :comments

        put '/blog/:id/like', to: 'blogs#like', as: 'like'
      end
      get '/blogs/timeline/:id', to: 'blogs#timeline', as: 'timeline'

      namespace :user do
        resources :users, only: %i[create show]

        post '/users/:id/follow', to: "users#follow", as: "follow_user"
        post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
      end

      resources :artworks
      resources :nfts
      resources :collections
      resources :purchases
      resources :posts
      resources :tutorials
    end
  end
end
