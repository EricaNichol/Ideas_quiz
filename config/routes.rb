Rails.application.routes.draw do

  resources :users, only: [:new, :create] do
    collection do
      get :edit
      get :update
    end
  end

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end


  resources :ideas do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end

  root 'ideas#index'

end
