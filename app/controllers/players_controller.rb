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
    if Player.exists?(params[:id])
      @player = Player.find(params[:id])
    else
      flash[:message] = "Do not have access to view this page."
      redirect_to player_path(@current_player)
    end
    @wins = @player.player_wins
    @losses = @player.player_losses
    @win_percentage = @player.win_percentage
    @total_games_played = @wins + @losses
    @player.find_nemesis
  end

  private

  def player_params
    params.require(:player).permit(:name, :league_id, :password, :password_confirmation)
  end

end
