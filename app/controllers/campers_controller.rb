class CampersController < ApplicationController
  before_action :find_camper, only: [:show, :edit, :update, :destroy]
  
  def index
    @campers = Camper.all
  end

  def show
  end

  def edit
  end

  def update
    @campaign.update(camper_params)
    redirect_to camper_path(@camper)
  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    @camper.save
    redirect_to camper_path(@camper)
  end

  def destroy
    redirect_to campers_path
  end

  private

  def find_camper
    @camper = Camper.all.find(params[:id])
  end

  def camper_params
    params.require(:camper).permit(:name, :age)
  end

end
