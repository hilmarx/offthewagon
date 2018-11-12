class BookingsController < ApplicationController

  def index
    @user_bookings = current_user.bookings
    @teacher_bookings = current_user.teacher.try(:bookings)
    @teacher = params[:teacher_id]
  end

  def show
    mango
    @teacher = params[:teacher_id]
  end

  def new
   @teacher = Teacher.find(params[:teacher_id])
   @booking = Booking.new
 end

 def approve
  mango
  @booking.approved!
  redirect_to bookings_path
end

def cancel
  mango
  @booking.cancelled!
  redirect_to bookings_path
end

def complete
  mango
  @booking.completed!
  redirect_to bookings_path
end

def create
  @user = current_user
  @teacher = Teacher.find(params[:teacher_id])
  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.teacher_id = @teacher.id
  if @booking.save
    redirect_to booking_path(@booking)
  else
    render :new
  end
end

def destroy
  mango
  @booking.destroy
  redirect_to bookings_path
end

private

def mango
  @booking = Booking.find(params[:id])
end

def booking_params
  params.require(:booking).permit(:teacher_id, :start_time, :end_time, :total_price, :status)
end

def booking_time_params
  params.require(:booking).permit(:start_time, :end_time)
end
end


#controller, routes, added routing buttons to teacher for new booking, teacher index/user index of bookings

