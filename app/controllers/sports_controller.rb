class SportsController < ApplicationController

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.valid?
      @sport.save
      redirect_to new_game_path
    else
      render '/sports/new'
    end
  end


  def show
    @sport = Sport.find(params[:id])
  end

  private

  def sport_params
    params.require(:sport).permit(:name, :rules)
  end
end
