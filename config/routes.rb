Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'bouquets/new', to: 'bouquets#new'
  get 'bouquets/confirm/:id', to: 'bouquets#confirm'
  get 'bouquets/:id', to: 'bouquets#show'

  root 'bouquets#new'
end
