Rails.application.routes.draw do
  devise_for :dim_users, path: 'users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }, controllers: {
    registrations: 'dim_users/registrations'
  }, sign_out_via: [:get, :delete]

  get 'home/index'
  root to: 'home#index'

  namespace :providers do
    get 'dashboard', to: 'dashboard#show'
    resources :dim_availabilities, only: [:new, :create, :index], controller: 'providers/availabilities'
    resources :dim_providers, except: [:new, :create]
  end

  get 'consumers/dashboard', to: 'consumers#dashboard', as: :consumers_dashboard

  get 'providers/new', to: 'providers#new', as: 'new_provider'
end
