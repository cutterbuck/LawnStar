class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    byebug
    opponent = PlayerGame.create( player_id: params[:game][:opponent], game_id: @game.id, score: params["opponent_score"].to_s)
    # if @game.valid?
      @game.save
      redirect_to game_path(@game)
    #else
    #  render :new
    #end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:sport_id, :opponent, :arena, :date, "your_score", "opponent_score")
  end
end
