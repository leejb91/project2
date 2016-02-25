class PerformancesController < ApplicationController
  before_action :admin_authorize, only: [:new, :edit]

  def new
    @performance = Performance.new
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
end
