Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  root to: 'homes#top'
 
  resources :homes,only:[:top,:index]
  resources :books 
  resources :user,only:[:show,:index,:edit,:update]
  
end
