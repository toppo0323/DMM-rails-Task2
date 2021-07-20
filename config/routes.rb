Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
 
  resources :books do
    collection do
      get 'top'
    end
  end
  
end
