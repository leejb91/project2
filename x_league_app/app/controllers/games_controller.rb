class GamesController < ApplicationController
  # before_action :set_house, only: [:show, :edit, :update, :destroy]
   # add the line below
  # before_action :authorize, except: [:index, :show]
  before_action :admin_authorize, only: [:new]

  def new
    @game = Game.new
    # @teams = Team.order(:name)
  end

  def index
    @games = Game.all
    @players = Player.all
    @performances = Performance.all
    @teams = Team.all
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(params.require(:game).permit(:name, :division))
      redirect_to edit_game_path(@game.id)
    else
      render :edit
    end
  end

  def show
    @game = Game.find(params[:id])
  end

end
