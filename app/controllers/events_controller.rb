class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  # GET /events
  # GET /events.json
  def index
    # Get events that haven't already happened prior to current day
    @events = Event.where("date >= ?", Time.now).order("date ASC")
    @title  = Time.now.year.to_s() + " Programme"
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def event_params
#       params.require(:event).permit(:name, :date, :location, :description)
#     end
end
