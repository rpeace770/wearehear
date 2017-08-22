require 'twilio-ruby'

class TextsController <  ApplicationController


  def create
    @text = Text.new(text_params)
    # @text.image_url = 'https://s3.amazonaws.com/wearehear/giphy.gif'
    @text.send_sms(@text.clean_number, @text.sender, @text.special_path, @text.image)
    redirect_to "/users/#{current_user.id}"
  end

  private
    def text_params
      params.require(:text).permit(:number, :sender, :special_path, :image)
    end

end
