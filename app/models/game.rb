class Game < ApplicationRecord
  belongs_to :sport
  has_many :player_games
  has_many :players, through: :player_games
end
