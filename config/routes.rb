Rails.application.routes.draw do
 get '/texts/index'
post '/texts/send_text' => 'texts#send_text'
# get '/twilio/index' => 'twilio#index'
# post '/twilio/send_text_message'  => 'twilio#send_text_message'
root 'texts#index'
end
