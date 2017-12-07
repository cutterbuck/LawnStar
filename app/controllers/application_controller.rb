class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized
  helper_method :logged_in?

  # who is my current user
  # am i logged in or not
  

  def current_player

    if session[:player_id]
      @current_player ||= Player.find(session[:player_id])
    end
  end


  def logged_in?
    !!current_player
  end


  def authorized
    #byebug
    if logged_in?
    else
      redirect_to signin_path
    end
  end
end
