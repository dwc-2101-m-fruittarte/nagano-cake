Rails.application.routes.draw do

  devise_for :managers
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
  resources :products, only: [:index, :show, :edit, :create, :new, :update]
  resources :cart_item, only: [:index, :create, :update, :destroy]

end