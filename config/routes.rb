Rails.application.routes.draw do

  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }
  namespace :managers do
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders
    patch '/orders/:id/order_status' => 'orders#order_status_update', as: "order_status"
    patch '/orders/:id/make_status' => 'orders#make_status_update', as: "item_status" # 製作ステータスupdate
    resources :deliveries


  end

  devise_for :customers, contollers: {
    registrations: 'customers/registrations',
    sessions:      'customers/sessions'
  }

  root :to => "homes#top"
  get "homes/about" => "homes#about"

  # resources :customers, only: [:show, :edit, :update] do
  #   get "/customers" => "customers#confirm"
  #   patch "/customers/:id/customers" => "customers#withdraw"
  # end

  resource :customers, only: [:edit, :update]
  get "customers/mypage" => "customers#show"
  get "customers/confirm" => "customers#confirm"
  patch "customers/withdraw" => "customers#withdraw"


    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'info'
        get 'thanks'
      end
    end

  resources :deliveries, only: [:index, :create, :edit, :update, :destroy] do
    patch 'deliveries/:id/edit' => 'deliveries#edit'  #追加
  end

  resources :products, only: [:index, :show] do
    resources :cart_items, only: [:create]
  end
   resources :cart_items, only: [:index, :update, :destroy]
  delete '/cart_items' => 'cart_items#destroy_all'

end