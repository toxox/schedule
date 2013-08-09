class DaysController < ApplicationController
  respond_to :json

  def index
    respond_with Day.all
  end

  def show
    respond_with Day.find(params[:id])
  end

  def create
    respond_with Day.create(day_params)
  end

  def update
    respond_with Day.update(params[:id], day_params)
  end

  def destroy
    respond_with Day.destroy(params[:id])
  end

  private
  def day_params
    params.require(:day).permit(:name)
  end
end