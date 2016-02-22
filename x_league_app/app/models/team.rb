class Team < ActiveRecord::Base
  has_many :GamesTeams, :players
  has_many :games, through: :GamesTeams
end
