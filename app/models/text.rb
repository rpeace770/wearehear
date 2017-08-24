class Text < ApplicationRecord

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end


  def send_sms
  twilio_number = "5128317223"
  @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

  @client.messages.create({
    from: twilio_number,
    to: '+1'+clean_number,
    body: sender + " sent you a bouquet from WeAreHear! Click " + special_path + " to view it!",
    media_url: image})
  end


end
