class DaysController < ApplicationController
  respond_to :json

  def index
    respond_with Day.all
  end

  def show
    respond_with Day.find(params[:id])
  end

  private
  def day_params
    params.require(:day).permit(:name)
  end
end