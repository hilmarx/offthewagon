class BookingsController < ApplicationController

  def index
    @teacher = current_user.teacher
    @user_bookings = current_user.bookings
   @teacher_bookings = @teacher.bookings

    if current_user.bookings
      @teacher = Teacher.find_by(user_id: current_user.id)
      @user_bookings = current_user.bookings
      @teacher_bookings = Booking.where(teacher_id: @teacher.id)
    else
      puts "no bookings"
    end

  end

  def show
    @booking = Booking.find(params[:id])
    @teacher = params[:teacher_id]
  end

  def new
   @teacher = Teacher.find(params[:teacher_id])
   @booking = Booking.new
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    booking.update(booking_time_params)
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

  private

  def booking_params
    params.require(:booking).permit(:teacher_id, :start_time, :end_time, :total_price, :status)
  end

  def booking_time_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end

