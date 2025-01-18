Rails.application.routes.draw do
  root "urls#index"  # Default route
  
  resources :urls, only: [:new, :create, :index, :show]
end
