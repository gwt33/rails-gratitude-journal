Rails.application.routes.draw do
  resources :gratitudes
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  # required for devise
  root to: 'static#home'

end
