Rails.application.routes.draw do
  root  'groups#index'
  # resource  :group
  resources :groups
end
