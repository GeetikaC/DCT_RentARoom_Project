Rails.application.routes.draw do
  resources :rooms
  devise_for :users
  resources :amenities
  resources :cities
  resources :bookings
  resources :reviews
  resources :special_prices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rooms#index'
end
