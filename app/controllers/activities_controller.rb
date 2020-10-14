class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show, :edit, :update, :destroy]
  
  def index
    @activities = Activity.all
  end

  def show
  end

  def edit
  end

  def update
    @campaign.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.save
    redirect_to activity_path(@activity)
  end

  def destroy
    redirect_to activities_path
  end

  private

  def find_activity
    @activity = Activity.all.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :difficulty)
  end

end
