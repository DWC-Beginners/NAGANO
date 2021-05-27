Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :publics do
    root 'homes#top'
    get 'home/about' => 'homes#about'
    get "/orders/complete"
    post "orders/comfirm"
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    patch "customers/withdraw", to: 'customers#withdraw'
    resources :products
    resources :customers
    resources :orders
    resources :addresses
    resources :cart_items do
      collection do
        delete 'all_destroy'
      end
    end
  end
 namespace :admins do
    # root 'devise/sessions#new'
    root to: "homes#top"
    get 'homes/top' => 'homes#top'
    resources :products
    resources :customers
    resources :genres
    resources :orders do
        patch :order_details
    end
 end
end


