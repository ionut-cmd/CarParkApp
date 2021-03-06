Rails.application.routes.draw do
  devise_for :users
  resources :carparks
  resources :reservations
  root 'home#home'
  get 'contact', to:'home#contact'
  post 'request_contact', to: 'home#request_contact'
  get 'about', to: 'home#about'
  get 'reservations', to: 'home#reservations'
  get 'carparks', to: 'home#carparks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
