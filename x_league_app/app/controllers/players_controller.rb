class PlayersController < ApplicationController
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

  def favorite
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def pick_favorite
    current_user.update_attributes(favorite: params[:id])
    redirect_to favorite_path(params[:id])
  end
end
