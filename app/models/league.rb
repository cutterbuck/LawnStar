class League < ApplicationRecord
  has_many :players


  def games_played
    self.players.collect{|p| p.games.collect{|g| g.id}}.flatten.uniq.count
  end

  def find_mvp
    mvp = nil
    mvp_percentage = 0
    self.players.each do |player|
      if player.win_percentage > mvp_percentage
        mvp_percentage = player.win_percentage
        mvp = player
      end
    end
    mvp
  end
end
