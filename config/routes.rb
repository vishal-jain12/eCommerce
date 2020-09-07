Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'authentication#login'
      resources :products, only: [:index]
      resources :cart, only: [:show] do
        put 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart', on: :collection
      end
    end
  end
end
