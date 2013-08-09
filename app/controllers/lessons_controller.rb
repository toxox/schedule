class LessonsController < ApplicationController
  respond_to :json

  def index
    respond_with Lesson.all
  end

  def show
    respond_with Lesson.find(params[:id])
  end

  def create
    respond_with Lesson.create(day_params)
  end

  def update
    respond_with Lesson.update(params[:id], day_params)
  end

  def destroy
    respond_with Lesson.destroy(params[:id])
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :teacher, :time)
  end
end