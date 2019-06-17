Rails.application.routes.draw do
  root "products#index"
  resources :products do
    get :list, on: :collection
  end
  resources :line_items, only: [:create]
  resources :carts, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
