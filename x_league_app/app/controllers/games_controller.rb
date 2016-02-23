class GamesController < ApplicationController
  # before_action :set_house, only: [:show, :edit, :update, :destroy]
   # add the line below
  # before_action :authorize, except: [:index, :show]

  def new
    @game = Game.new
    @teams = Team.order(:name)
  end

end
