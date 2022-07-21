Rails.application.routes.draw do


    # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  root to: 'public/homes#top'

  get 'publics/homes/about' => 'publics/homes#about', as: 'about'



  namespace :public do
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]

    resources :orders, only:[:new,:index,:show,:create]
    post 'orders/confirm'
    post 'orders/complete'


    resources :cart_items, only:[:index,:create,:update,:destroy]
    delete 'cart_items/destroy_all'

<<<<<<< HEAD
    resources :cart_items, only:[:show,:edit,:update]


    resources :cart_items, only:[:index,:create,:update,:destroy]
    delete 'cart_items/destroy_all'

    resources :cart_items, only:[:show,:edit,:update]

=======
    resources :customers, only:[:show,:edit,:update]
>>>>>>> origin/develop
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'

    resources :items, only:[:index,:show]

  end


  namespace :admin do
    root to: 'homes#top'
    resources :makings, only:[:update]

    resources :orders, only:[:edit,:update]

    resources :customers, only:[:index,:show,:edit,:update]

    resources :genres, only:[:index,:create,:edit,:update]

    resources :items, only:[:index,:new,:create,:show,:edit,:update]
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
