Rails.application.routes.draw do
  devise_for :users
  root  'groups#index'
  # resource  :group
  resources :groups do
    resources :posts
  end
end
