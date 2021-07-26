Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  root to: 'homes#top'
  
  Rails.application.routes.draw do
  get "home/about", to: 'homes#index', as: :homes
end

  resources :homes,only:[:top,:index]
  resources :books 
  resources :users,only:[:show,:index,:edit,:update]
  

  
end

