class Api::V1::BartSchedulesController < ApplicationController
  def index
    @bart_schedule = BartSchedule.new
    @params = schedule_params
    cmd = schedule_params["cmd"]
    orig = schedule_params["orig"]
    dest = schedule_params["dest"]

    case cmd
    when "depart"
      @departures = @bart_schedule.get_schedule(cmd,orig,dest)

      respond_to do |format|
         format.html { render :index }
         format.json { render json: @departures, status: 200 } 
      end
    when "arrive"
      @departures = @bart_schedule.get_schedule(cmd,orig,dest)    
  
      respond_to do |format|
         format.html { render :index }
         format.json { render json: @departures, status: 200 }
      end
    else

      @departures = "{ message: request not found. Http Error Code 404. }"
      respond_to do |format|
         format.html { render :index }
         format.json { render json: @departures, status: 404 }
      end
    end
    
  end

  def new

  end

  def create

  end
  
  def show

  end

  def edit

  end
    
  def update

  end

  def destroy

  end

  private
  # Using a private method to encapsuilate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you can
  # speciailze this miethod with per-user checking of permissible attributes.

  def schedule_params 
    #puts params.permit(:depart, :orig, :dest)
    params.permit(:cmd,:orig,:dest)
  end

end
