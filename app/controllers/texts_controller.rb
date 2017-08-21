require 'twilio-ruby'

class TextsController <  ApplicationController

  def create
    @text = Text.new(text_params)
    @text.send_sms(@text.clean_number, @text.sender, @text.image_url)
    redirect_to '/users/current_user.id'
  end

  private
    def text_params
      params.require(:text).permit(:number, :sender, :image_url)
    end

end
