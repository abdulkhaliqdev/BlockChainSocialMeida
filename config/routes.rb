Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end

  resources :users, only: %i[create]
  devise_for :users
  resources :blogs

  root 'blogs#index'
end
