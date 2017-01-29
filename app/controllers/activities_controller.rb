class ActivitiesController < ApplicationController
  def index

    if params[:month]
      @activities = Activity.this_month.group_by_day(:created_at).sum(:distance)
    else
      @activities = Activity.this_week
    end


  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new activity_params
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
