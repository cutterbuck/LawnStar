class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def create
    @league = League.create(league_params)
    redirect_to league_path(@league)
  end

  def show
    @league = League.find(params[:id])
    @games_played = @league.games_played
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end

end
