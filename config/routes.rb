Estedad::Application.routes.draw do

  root to: 'blogs#index'
  
  resources :pages
  resources :blogs
  resources :forms do
    resources :filled_forms, only: [:show, :create, :update, :new, :edit]
  end

  devise_for :admins
  devise_for :users

  mount Attachinary::Engine => "/attachinary"

  namespace :admins do
    resources :users
    resources :forms do
      resources :filled_forms
      resources :fields do
        collection do
          put :sort
        end
      end
    end
  end

end
