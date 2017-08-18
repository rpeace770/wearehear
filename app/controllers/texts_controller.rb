require 'twilio-ruby'

class TextsController <  ApplicationController

  def index
    @text = Text.new
  end

  def send_text
    @text = Text.new(text_params)
    @text.send_sms(@text.clean_number, @text.message, @text.sender)
    redirect_back fallback_location: "http://www.rubyonrails.org"
  end



private

  def text_params
     params.require(:text).permit(:number, :message, :sender)
  end
end
