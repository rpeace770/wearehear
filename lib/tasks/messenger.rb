module Messenger

  def send_sms(number, message)
    account_sid = 'AC95dba1864d9daff62e736a02d0402d21'
    auth_token = '1e34eae13b33504dbe5b50c9a0c51c97'
    from = '5128317223'

    @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create(
    from: from,
    to: '+1'+number,
    body: message
   )
  end

end
