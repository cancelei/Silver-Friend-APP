Rails.application.routes.draw do
  devise_for :dim_users, path: 'users', path_names: {
  sign_in: 'login',
  sign_out: 'logout',
  sign_up: 'register'
}, sign_out_via: [:get, :delete]

  get 'home/index'
  root to: 'home#index'

  namespace :providers do
    get 'dashboard', to: 'dashboard#show'
    resources :dim_availabilities, only: [:new, :create, :index]
    resources :dim_providers, except: [:new, :create]
  end

  resources :dim_providers

  get 'providers/new', to: 'providers#new', as: 'new_provider'
end
