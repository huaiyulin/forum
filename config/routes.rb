Rails.application.routes.draw do
  devise_for :users
  root  'groups#index'
  # resource  :group
  resources :groups do
  	member do
      post :join
      post :quit
    end
    resources :posts
  end
end
