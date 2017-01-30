class ActivitiesController < ApplicationController

  before_action :authenticate_user!

  def index

    if params[:month]
      @activities = Activity.this_month.by_user(current_user).group_by_day(:created_at).sum(:distance)
    else
      @activities = Activity.this_week.by_user(current_user)
    end

    if @activities.count < 1
      @activity = Activity.new
      flash[:notice] = "You don't have activities. Make a new one."
      render 'new'
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
    @activity.user = current_user
    if @activity.save
      redirect_to @activity
    else
      render 'new'
    end
  end

  private

    def activity_params
      params.require(:activity).permit(:start, :destination)
    end

end
