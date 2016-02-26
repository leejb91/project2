class PerformancesController < ApplicationController
  before_action :admin_authorize, only: [:new, :edit]

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(params.require(:performance).permit(:player_id, :game_id, :pts, :fgm, :fga, :tpm, :tpa, :ftm, :fta, :reb, :ast, :stl, :blk))

    if @performance.save
      flash[:notice] = "You have successfully created a performance!"
      redirect_to performances_path
    else
      render :new
    end
  end

  def show
    @performance = Performance.find(params[:id])
  end

  def edit
    @performance = Performance.find(params[:id])
  end

  def update
    @performance = Performance.find(params[:id])

    if @performance.update_attributes(params.require(:performance).permit(:pts, :fgm, :fga, :tpm, :tpa, :ftm, :fta, :reb, :ast, :stl, :blk))
      redirect_to edit_performance_path(@performance.id)
    else
      render :edit
    end
  end

  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy
    flash[:notice] = "You have successfully deleted a performance!"
    redirect_to performances_path
  end
end
