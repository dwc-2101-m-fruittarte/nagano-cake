Rails.application.routes.draw do

  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }
  namespace :managers do
    resources :products
    resources :customers
    resources :orders
  end

  devise_for :customers
  root :to => "homes#top"
  get "homes/about" => "homes#about"

  resources :customers, only: [:show, :edit, :update, :destroy] do
    patch "/customers" => "customers#withdraw"
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'info'
        get 'thanks'
      end
    end
  end
  resources :products, only: [:index, :show, :edit, :create, :new, :update] do
    resources :cart_items, only: [:create]
  end
   resources :cart_items, only: [:index, :update, :destroy]
  delete '/cart_items' => 'cart_items#destroy_all'

end