Rails.application.routes.draw do
  root 'main#index'
  get 'orders' => 'main#index'
  get 'orders/new' => 'main#index'
  scope :api do
    resources :products, only: :index
    resources :orders, except: %i[new show edit update destroy]
  end
end
