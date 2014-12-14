class CreateLawnBookings < ActiveRecord::Migration
  def change
    create_table :lawn_bookings do |t|
      t.integer :lawn_no
      t.date :booking_date

      t.timestamps
    end
  end
end
