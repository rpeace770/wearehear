
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to "/"
    end
  end

end
