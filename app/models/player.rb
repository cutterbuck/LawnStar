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
      if opponent_id == self.id
        opp_score = PlayerGame.where("game_id = ?", pg.game.id).last.score
        if my_score > opp_score
          wins += 1
        end
      else
        opp_score = PlayerGame.find_by(game_id: pg.game.id, player_id: opponent_id ).score
        if my_score > opp_score
          wins += 1
        end
      end
    end
    wins
  end

  def player_losses
    losses = 0
    self.player_games.each do |pg|
      my_score = pg.score
      opponent_id = pg.game.opponent.to_i
      if opponent_id == self.id
        opp_score = PlayerGame.where("game_id = ?", pg.game.id).last.score
        if my_score < opp_score
          losses += 1
        end
      else
        opp_score = PlayerGame.find_by(game_id: pg.game.id, player_id: opponent_id ).score
        if my_score < opp_score
          losses += 1
        end
      end
    end
    losses
  end

  def find_rival
    rival_hash = Hash.new(0)
    self.games.each do |game|
      two_player_games_to_game = PlayerGame.where("game_id = ?", game.id)
      my_player_game = two_player_games_to_game.where("player_id =?", self.id).first
      their_player_game = two_player_games_to_game.where("player_id !=?", self.id).first
      if rival_hash[their_player_game.player.name]
        rival_hash[their_player_game.player.name] += 1
      end
    end
    rival_hash.sort_by{|k, v| v}.last
  end

  def find_nemesis
    nemesis_hash = Hash.new(0)
    self.games.each do |game|
      two_player_games_to_game = PlayerGame.where("game_id = ?", game.id)
      my_player_game = two_player_games_to_game.where("player_id =?", self.id).first
      their_player_game = two_player_games_to_game.where("player_id !=?", self.id).first
      if nemesis_hash[their_player_game.player.name]
        if my_player_game.score < their_player_game.score
          nemesis_hash[their_player_game.player.name] += 1
        end
      end
    end
    nemesis_hash.sort_by{|k, v| v}.last
    #byebug
  end

  def win_percentage
    ((player_wins.to_f/(player_wins + player_losses).to_f)*100).round(2)
  end

end
