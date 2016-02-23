class Team < ActiveRecord::Base
  # has_many :games
  has_many :players

  def games
    Game.where("home_team=" + self.id.to_s + " OR away_team=" + self.id.to_s)
  end

  def home_games
    Game.where(home_team: self.id)
  end

  def away_games
    Game.where(away_team: self.id)
  end

end
