class SignupsController < ApplicationController
    before_action :find_signup, only: [:show, :edit, :update, :destroy]
  
    def index
      @signups = Signup.all
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @campaign.update(signup_params)
      redirect_to signup_path(@signup)
    end
  
    def new
      @signup = Signup.new
    end
  
    def create
      @signup = Signup.new(signup_params)
      @signup.save
      redirect_to camper_path(@signup.camper)
    end
  
    def destroy
      redirect_to signups_path
    end
  
    private
  
    def find_signup
      @signup = Signup.all.find(params[:id])
    end
  
    def signup_params
      params.require(:signup).permit(:time, :camper_id, :activity_id)
    end
end
