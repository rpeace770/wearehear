require 'twilio-ruby'

class TextsController <  ApplicationController

  def create
    @text = Text.new(text_params)
    @text.send_sms(@text.clean_number, @text.sender)
    redirect_to '/users/current_user.id'
  end

  private
    def text_params
      params.require(:text).permit(:number, :sender)
    end

end
