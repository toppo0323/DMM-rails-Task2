Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  root to: 'homes#top'
 
  resources :books do
    collection do
      get 'top'
    end
  end
  resources :user,only:[:show,:index,:edit,:update]
  
end
