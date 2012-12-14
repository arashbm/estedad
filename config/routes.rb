Estedad::Application.routes.draw do


  namespace :admins do
    resources :forms do
      resources :filled_forms
      resources :fields do
        collection do
          put :sort
        end
      end
    end
  end

  resources :forms do
    resources :filled_forms, only: [:show, :create, :update, :new, :edit]
  end

  resources :blogs

  root to: 'blogs#index'

  devise_for :admins
  devise_for :users
end
