class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # added from omniauth article, can change if we need to
  before_action :authenticate_user!
end
