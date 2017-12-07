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

  def sports
    sports_array = self.players.collect{|p| p.games.collect{|g| g.sport}}.flatten.uniq
  end

  def find_league_player_with_least_amount_of_games
    slacker = nil
    if self.players.empty?
      slacker = "None yet"
    else
      slacker_game_count = self.players.first.games.count
      self.players.each do |player|
        if player.games.count <= slacker_game_count
          slacker = player
          slacker_game_count = player.games.count
        end
      end
    end
    slacker
  end

end
