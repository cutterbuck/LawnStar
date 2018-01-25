  class Game < ApplicationRecord
  belongs_to :sport
  has_many :player_games
  has_many :players, through: :player_games
  #validate :cannot_tie

  def cannot_tie
    byebug
  end
  #validate score is not tied, games can never end in a tie bro
  def game_winner_or_loser_message
    #byebug
    their_pg = self.player_games.first
    my_pg = self.player_games.last
    @their_name = their_pg.player.name
    winner_pg = 0
    winner_player = ''
    self.player_games.each do | pg|
      if pg.score > winner_pg
        winner_pg = pg.score
        winner_player = pg.player.name
      end
    end
    if winner_player == my_pg.player.name
      "You whooped #{@their_name.capitalize}'s ass! Good job bro!"
    else
      "#{@their_name.capitalize} massacred you bro, take a lap!"
    end
  end

  def opponent_name
    Player.find(self.opponent).name
  end

end
