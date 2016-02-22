class Game < ActiveRecord::Base
  has_many :GamesTeams
  has_many :teams, through: :GamesTeams
  has_many :performances
  has_many :players, through: :performances
  # has_and_belongs_to_many :players
end
