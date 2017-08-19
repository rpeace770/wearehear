Rails.application.routes.draw do
<<<<<<< HEAD
 get '/texts/index'
post '/texts/send_text' => 'texts#send_text'
# get '/twilio/index' => 'twilio#index'
# post '/twilio/send_text_message'  => 'twilio#send_text_message'
root 'texts#index'
=======
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'bouquets/new', to: 'bouquets#new'
  get 'bouquets/confirm/:id', to: 'bouquets#confirm'
  get 'bouquets/:id', to: 'bouquets#show'

  root 'bouquets#new'
>>>>>>> master
end
