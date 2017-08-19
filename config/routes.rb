Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  get 'bouquets/new', to: 'bouquets#new'
  get 'bouquets/confirm/:id', to: 'bouquets#confirm'
  get 'bouquets/:id', to: 'bouquets#show'
  post 'bouquets/create', to: 'bouquets#create'
  post 'texts/create', to: 'texts#create'
  get 'users/:id', to: 'users#show'

  root 'bouquets#new'



end
