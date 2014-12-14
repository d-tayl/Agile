require 'reloader/sse'

class LawnBookingsController < ApplicationController
  include ActionController::Live
   
  def index
    # number of days to show not including the current day
    @future_days_to_show  = 9  
    
    # get any bookings that happen between the current date and the current date plus the number of days to show
    @lawn_bookings = LawnBookings.where("booking_date >= ? AND booking_date <= ?", Time.now.to_date, @future_days_to_show.days.from_now.to_date).order("booking_date ASC")
    @title  = "Book a lawn"
  end
  
  def book_lawn

    # Check if entry already exists
    lawn_booking = LawnBookings.where(booking_date: params[:booking_date], lawn_no: params[:lawn_no])
    if lawn_booking.count == 0
      # Create new booking based on params
      @lawn_booking = LawnBookings.new
      @lawn_booking.lawn_no = params[:lawn_no]
      @lawn_booking.booking_date = params[:booking_date]
      @lawn_booking.save
    end
    
    # Return JSON to booking user
    if request.xhr?
        render :json => {
          :booking_date => params[:booking_date], :lawn_no => params[:lawn_no]   }          
    end
end
  
    def bookings_sse
      
      # Set up event-stream for SSE
      response.headers['Content-Type'] = 'text/event-stream'
      sse = Reloader::SSE.new(response.stream)
      
      begin 
        # Get lawn bookings for next 10 days
           lawnbookings = LawnBookings.where("booking_date >= ? AND booking_date <= ?",Time.now.to_date, 9.days.from_now.to_date).order("booking_date ASC")
            if lawnbookings.count != 0
              LawnBookings.uncached do
                lawnbookings.each do |lawnbook|
                  # Let the browser know there's a booking for a given lawn and date
                  sse.write({ :booking_date => lawnbook.booking_date, :lawn_no => lawnbook.lawn_no},               :event => "update")
                  sleep 0.1
                end
              end
            end
      rescue
        # When client disconnects, we'll get an IOError on write
      ensure
        sse.close
      end
    end
end
    