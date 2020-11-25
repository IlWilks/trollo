Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #devise needs root
  root "boards#index"

  resources :boards do
    resources :lists
  end
end
