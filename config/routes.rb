Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'homes#top'
 get 'home/about' => 'homes#about'
 resources :items
 resources :customers
 resources :cart_items
 resources :orders
 resources :deliveries

 namespace :admin do
    root 'homes#top'
    resources :products
    resources :customers
    resources :genres
    resources :orders do
        patch :order_details
    end
 end
end


