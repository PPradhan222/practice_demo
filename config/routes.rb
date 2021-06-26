Rails.application.routes.draw do
  root "authors#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors
  resources :books

  get 'api/v1/authors' => 'api/v1/authors#index'
end
