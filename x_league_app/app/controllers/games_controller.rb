class GamesController < ApplicationController
  before_action :admin_authorize, only: [:new, :edit]

  def new
    @game = Game.new
    # @teams = Team.order(:name)
  end

  def create
    @game = Game.new(params.require(:game).permit(:game_number, :date, :home_id, :home_points, :away_id, :away_points))

    if @game.save
      flash[:notice] = "You have successfully created a game!"
      redirect_to games_path
    else
      render:new
    end
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

  def destroy
    @game = Game.find(params[:id])
    @game.performances.each do |p|
      p.destroy
    end
    @game.destroy
    flash[:notice] = "You have successfully deleted a game!"
    redirect_to games_path
  end

end
