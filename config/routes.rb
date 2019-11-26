Rails.application.routes.draw do
  resources :books
  root "books#index"
  get '/search', to: 'books#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
