class Player < ApplicationRecord
  belongs_to :league
  has_many :player_games
  has_many :games, through: :player_games
  has_secure_password

  def player_wins
    wins = 0
    self.player_games.each do |pg|
      my_score = pg.score
      opponent_id = pg.game.opponent.to_i
      opp_score = PlayerGame.find_by(game_id: pg.game.id, player_id: opponent_id ).score
      if my_score > opp_score
        wins += 1
      end
    end
    wins
  end

  def player_losses
    losses = 0
    self.player_games.each do |pg|
      my_score = pg.score
      opponent_id = pg.game.opponent.to_i
      opp_score = PlayerGame.find_by(game_id: pg.game.id, player_id: opponent_id ).score
      if my_score < opp_score
        losses += 1
      end
    end
    losses
  end

end
