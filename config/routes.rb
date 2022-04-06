Rails.application.routes.draw do
  resources :groups do
    collection {
      post :import
      get :import_page
    }
  end
  root to: 'groups#index'
end
