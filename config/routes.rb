Sandwichorder::Application.routes.draw do
  devise_for :users

  resources :orders

  root :to => 'orders#index'
end
