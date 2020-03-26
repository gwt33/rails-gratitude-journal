Rails.application.routes.draw do
  
  # required for devise
  root to: 'static#home'
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :comments

  resources :users do
    resources :posts, only: [:new, :create, :index]
  end
  
  resources :gratitudes do
    resources :comments, only: [:new, :create, :index]
  end
  
end
