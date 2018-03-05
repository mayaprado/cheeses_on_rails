Rails.application.routes.draw do
  get "/", to: "cheeses#index"
  get "/cheesemongers_choice", to: "cheeses#random"
  resources :cheeses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
