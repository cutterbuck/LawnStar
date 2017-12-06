class PlayersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.valid?
      @player.save
      session[:player_id] = @player.id
      redirect_to player_path(@player)
    else
      render 'new'
    end
  end

  def show
    #byebug
    @player = Player.find(params[:id])
    if @current_player.id == @player.id
      @player
    else
      flash[:message] = "Do not have access to view this page."
      redirect_to player_path(@current_player)
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :league_id, :password, :password_confirmation)
  end

end
