Rails.application.routes.draw do
  resources :groups do
    collection do
      post :import
      get :import_page
    end
  end
  root to: 'groups#index'
end
