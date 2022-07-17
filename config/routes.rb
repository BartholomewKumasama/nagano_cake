Rails.application.routes.draw do

  namespace :publics do
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
    
    resources :orders, only:[:new,:index,:show,:create]
    post 'orders/confirm'
    post 'orders/complete'
    
    resources :cart_items, only:[:index,:create,:update,:destroy] 
    delete 'cart_items/destroy_all'
    
    resources :cart_items, only:[:show,:edit,:update] 
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'
    
    resources :items, only:[:index,:show] 
    
    root to: 'homes#top' 
    get '/about' => 'homes#about', as: 'about'
  end
  
  
  namespace :admins do
    resources :makings, only:[:update] 

    resources :orders, only:[:edit,:update] 

    resources :customers, only:[:index,:show,:edit,:update]

    resources :genres, only:[:index,:create,:edit,:update]

    resources :items, only:[:index,:new,:create,:show,:edit,:update]

    root to: 'homes#top' 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
