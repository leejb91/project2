class Game < ActiveRecord::Base
  has_many :performances
  has_many :players, through: :performances
  belongs_to :home_team, class_name: "Team", foreign_key: "home_id"
  belongs_to :away_team, class_name: "Team", foreign_key: "away_id"
  # has_and_belongs_to_many :players


end
