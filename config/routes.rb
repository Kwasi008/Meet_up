Rails.application.routes.draw do
  resources :groups do
    collection { post :import }
  end
  root to: 'groups#index'
end
