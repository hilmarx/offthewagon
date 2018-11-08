class BookingsController < ApplicationController

  def show
    @bookings = Booking.find(params[:id])
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @booking = Booking.new(booking_params)
    @booking.teacher_id = teacher.id
    if @booking.save
      redirect_to bookings_show_path
    else
      render :new
    end
  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @booking = Booking.new
  end

  private

  def booking_params
    params.require(:booking).permit(:teacher_id, :start_time, :end_time, :total_price, :status)
  end
end

