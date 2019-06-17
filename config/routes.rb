Rails.application.routes.draw do
  root "products#index"
  resources :products do
    get :list, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
