require 'pry'

class CallbacksController < Devise::OmniauthCallbacksController
  def spotify
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if request.env["omniauth.auth"].info.image.length > 0
      @user.picture_url = request.env["omniauth.auth"].info.image
    end
    @user.username = request.env["omniauth.auth"].info.display_name
    sign_in_and_redirect @user
  end
end

