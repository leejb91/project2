class TeamsController < ApplicationController
  before_action :admin_authorize, only: [:new, :edit]

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params.require(:team).permit(:name, :division))
      redirect_to edit_team_path(@team.id)
    else
      render :edit
    end
  end

  def index
    @teams = Team.all
  end
end
