class Api::V1::BartSchedulesController < ApplicationController
  def schedules
    #@bart_schedule = BartSchedule.new
    @params = schedule_params
    cmd = schedule_params["cmd"]
    orig = schedule_params["orig"]
    dest = schedule_params["dest"]

    puts "cmd: " + cmd
    puts "orig: " + orig
    puts "dest: " + dest

    case cmd
    when "depart"
      #@departures = @bart_schedule.get_schedule(cmd,orig,dest)
      @departures = BartSchedule.get_schedule(cmd,orig,dest)

      respond_to do |format|
         #format.html { render :index }
         format.json { render json: @departures, status: 200 }
         puts "returned status 200."
         puts @departures.to_json
      end
    when "arrive"
      @departures = BartSchedule.get_schedule(cmd,orig,dest)

      respond_to do |format|
         #format.html { render :index }
         format.json { render json: @departures, status: 200 }
         puts "returned status 200."
         puts @departures.to_json
      end
    else

      @message = "{ message: request not found. Http Error Code 404. }"
      respond_to do |format|
         #format.html { render :index }
         format.json { render json: @message, status: 404 }
      end
    end
  end

  def stations
    @params = schedule_params
    cmd = schedule_params["cmd"]

    puts "cmd: " + cmd


    case cmd
    when "stns"
      @stations = BartSchedule.get_stations(cmd)

      respond_to do |format|
         #format.html { render :index }
         format.json { render json: @stations, status: 200 }
         puts "returned status 200."
         puts @stations.to_json
      end
    else
      @message = "{ message: request not found. Http Error Code 404. }"
      respond_to do |format|
         #format.html { render :index }
         format.json { render json: @message, status: 404 }
      end
    end

  end

  
  private
  # Using a private method to encapsuilate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you can
  # speciailze this miethod with per-user checking of permissible attributes.

  def schedule_params
    #puts params.permit(:depart, :orig, :dest)
    params.permit(:cmd,:orig,:dest)
  end

  def station_params
    params.permit(:cmd)
  end

end
