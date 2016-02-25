class Player < ActiveRecord::Base
  belongs_to :team
  has_many :performances
  has_many :games, through: :performances
  # has_and_belongs_to_many :games

end
