Rails.application.routes.draw do
  root 'main#index'
  get 'orders' => 'main#index'
  scope :api do
    resources :products, only: :index
    resources :orders, except: %i[new edit update destroy]
  end
end
