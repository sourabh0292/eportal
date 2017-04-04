Rails.application.routes.draw do
  
  devise_for :users
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :carts, only: :destroy
  resources :orders, only: [:new, :create, :show]
  resources :line_items, only: [:create, :destroy]
  resources :feedbacks, only: [:index, :new, :create]

root "catalogs#index"
get 'catalogs/index'



end
