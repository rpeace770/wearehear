Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'bouquets/new', to: 'bouquets#new'
  get 'bouquets/confirm/:id', to: 'bouquets#confirm'
  get 'bouquets/:id', to: 'bouquets#show'
  post 'spotify_search', to: 'spotify_search#index'
  get '/auth/spotify/callback', to: 'callbacks#spotify'
  post 'search', to: 'spotify_search#search'
  root 'bouquets#new'
end
