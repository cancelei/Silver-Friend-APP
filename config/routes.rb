Rails.application.routes.draw do
  devise_for :dim_users, path: 'users', path_names: {
  sign_in: 'login',
  sign_out: 'logout',
  sign_up: 'register'
}, sign_out_via: [:get, :delete]

  get 'home/index'
  root to: 'home#index'
end
