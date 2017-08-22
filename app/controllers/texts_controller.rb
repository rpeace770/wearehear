require 'twilio-ruby'

class TextsController <  ApplicationController


  def create
    @text = Text.new(text_params)
    @text.send_sms
    redirect_to "/users/#{current_user.id}"
  end

  private
    def text_params
      params.require(:text).permit(:number, :sender, :special_path, :image)
    end

end
