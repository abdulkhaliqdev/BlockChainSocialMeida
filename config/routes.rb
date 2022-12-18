Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  devise_for :users
  resources :blogs


  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :blogs, only: %i[index]

      namespace :user do
        resources :users, only: %i[create]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
