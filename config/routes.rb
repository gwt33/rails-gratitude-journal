Rails.application.routes.draw do
  
  # required for devise
  root to: 'static#home'
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :gratitudes do
    resources :comments
  end
  
  resources :comments

  resources :users do
    resources :gratitudes, only: [:new, :create, :index] #shallow routes: only nest the routes you need (crucial to know the post_id )
  end
  
end
