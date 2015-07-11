class BartSchedulesController < ApplicationController
  def index
    @bart_schedule = BartSchedule.new
    @departures=@bart_schedule.get_departures("SANL","EMBR")
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
    params.require(:bart_schedule).permit(:id)
  end

end
