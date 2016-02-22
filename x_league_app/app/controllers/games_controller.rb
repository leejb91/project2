class GamesController < ApplicationController
  def new
    @game = Game.new
    @teams = Team.order(:name)
  end

end
