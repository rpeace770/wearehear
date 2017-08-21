class Text < ApplicationRecord

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end

  def send_sms(number, sender, image_url)

    twilio_account_sid = 'AC95dba1864d9daff62e736a02d0402d21'
    twilio_auth_token = '1674fdd30ce800454e03c0c5f2834e3b'
    from = '5128317223'
    link = 'www.google.com'
    # photo = 'https://media.giphy.com/media/SRO0ZwmImic0/giphy.gif'
    #replace link with unique url and bouquet.photo, passed in as params


  @client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

  @client.messages.create({
    from: from,
    to: '+1'+number,
    body: sender + " sent you a bouquet from WeAreHear! Click " + link + " to view it!",
    media_url: image_url})
  end


end
