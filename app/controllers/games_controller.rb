class GamesController < ApplicationController

  #skip_before_action :authorized

  def new
    @game = Game.new
    @players = Player.all.select{|p| p != @current_player}
  end

  def create
    @game = Game.create(game_params)
    opponent = PlayerGame.create(player_id: params[:game][:opponent], game_id: @game.id, score: params["opponent_score"].to_s)
    me = PlayerGame.create(player_id: @current_player.id, game_id: @game.id, score: params["your_score"].to_s)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:sport_id, :opponent, :arena, :date, "your_score", "opponent_score")
  end
end
