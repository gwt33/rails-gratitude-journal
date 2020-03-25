Rails.application.routes.draw do
  
  # required for devise
  root to: 'static#home'
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:show]
  
  resources :gratitudes
  resources :comments
  


  

end
