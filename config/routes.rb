Rails.application.routes.draw do
  resources :groups
  root to: "groups#index"
end
