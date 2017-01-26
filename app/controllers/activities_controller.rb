class ActivitiesController < ApplicationController
  def index
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to @activity
    else
      render 'new'
    end
  end

  def delete
  end



  private

    def activity_params
      params.require(:activity).permit(:start, :destination)
    end

end
