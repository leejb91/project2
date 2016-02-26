class PlayersController < ApplicationController
  before_action :admin_authorize, only: [:new, :edit]

  def show
    @player = Player.find(params[:id])
  end

  def index
    @teams = Team.all
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(params.require(:player).permit(:name, :player_number))
      redirect_to edit_player_path(@player.id)
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.performances.each do |p|
      p.delete
    end
    @player.destroy
    flash[:notice] = "You have successfully deleted a player!"
    redirect_to players_path
  end

  def favorite
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params.require(:player).permit(:name, :player_number, :team_id))
    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  def pick_favorite
    current_user.update_attributes(favorite: params[:id])
    redirect_to favorite_path(params[:id])
  end
end
