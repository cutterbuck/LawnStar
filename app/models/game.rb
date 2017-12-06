class Game < ApplicationRecord
  belongs_to :sport
  has_many :player_games
  has_many :players, through: :player_games
  #validate score is not tied, games can never end in a tie bro


  def game_winner_or_loser_message
    byebug
    their_pg = self.player_games.select do |pg|
      !(pg.player.id == @current_player.id)
    end
    @their_name = their_pg.player.name

    winner_pg = self.player_games.first
    @current_player.name
    self.player_games.each do | pg|
      if winner_pg.score > pg.score
        winner_pg = pg
      end
    end

    if winner_pg.player.id == @current_player.id
      "You whooped #{@their_name}'s ass! Good job bro!"
    else
      "#{@their_name} massacred you bro, take a lap!"
    end
  end

  def opponent_name
    Player.find(self.opponent).name
  end
end
