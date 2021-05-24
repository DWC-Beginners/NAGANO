Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :publics do
    root 'homes#top'
    get 'home/about' => 'homes#about'
    resources :items
    resources :customers
    resources :orders
    resources :deliveries
    resources :cart_items do
      collection do
        delete 'all_destroy'
      end
    end
  end
 namespace :admins do
    root 'homes#top'
    resources :products
    resources :customers
    resources :genres
    resources :orders do
        patch :order_details
    end
 end
end


