class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def index
    @teams = Team.all
    @players = Player.all
  end
end
