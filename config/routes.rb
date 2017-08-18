Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/twilio/index' => 'twilio#index'
post '/twilio/send_text_message'  => 'twilio#send_text_message'

root 'twilio#index'

end
