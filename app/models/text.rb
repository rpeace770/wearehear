class Text < ApplicationRecord
  # include Messenger

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end

  def send_sms(number, message, sender)
    account_sid = 'AC95dba1864d9daff62e736a02d0402d21'
    auth_token = '1e34eae13b33504dbe5b50c9a0c51c97'
    from = '5128317223'
    link= 'a href="www.google.com">here</a>'.html_safe

    @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create({
    from: from,
    to: '+1'+number,
    body: "#{sender} wants to send you a bouquet! Click here to receive it!",
    media_url: 'https://media.giphy.com/media/SRO0ZwmImic0/giphy.gif'})

  end


end
