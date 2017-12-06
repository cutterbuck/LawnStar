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
    @player = Player.find(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:name, :league_id, :password, :password_confirmation)
  end

end
