class Game < ApplicationRecord
  belongs_to :sport
  has_many :player_games
  has_many :players, through: :player_games

  # validate :opponent_not_own_player
  #
  #
  # def opponent_not_own_player
  #   opponent = Player.find_by(name: self.opponent)
  #   if !(self.player_id == opponent.id)
  #     true
  #   else
  #     false
  #   end
  # end

  def opponent_name
    Player.find(self.opponent).name
  end
end
