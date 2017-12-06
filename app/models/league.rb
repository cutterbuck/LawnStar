class League < ApplicationRecord
  has_many :players


  def games_played
    self.players.collect{|p| p.games.collect{|g| g.id}}.flatten.uniq.count
  end
end
