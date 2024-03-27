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

  resource :provider, only: [] do
    resources :dim_availabilities, only: [:new, :create, :index]
  end

  get 'consumers/dashboard', to: 'consumers#dashboard', as: :consumers_dashboard
end
