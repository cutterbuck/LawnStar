class LeaguesController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :edit]

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def create
    @league = League.create(league_params)
    redirect_to signup_path
  end

  def show
    @league = League.find(params[:id])
    @games_played = @league.games_played
    @league_mvp = @league.find_mvp
    @league_slacker = @league.find_league_player_with_least_amount_of_games
    @league.sports
  end

  def edit

  end

  private

  def league_params
    params.require(:league).permit(:name)
  end

end
