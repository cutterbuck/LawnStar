class Player < ApplicationRecord
  belongs_to :league
  has_many :player_games
  has_many :games, through: :player_games
end
