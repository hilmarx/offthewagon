class BookingsController < ApplicationController

  def index
    @user_bookings = current_user.bookings
    # rather than If statement
    @teacher_bookings = current_user.teacher.try(:bookings)
    @teacher = params[:teacher_id]
    @teacher_booking = policy_scope(Teacher)
  end

  def show
    set_booking
    @teacher = params[:teacher_id]
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    booking = Booking.find(params[:id])
    booking.update(booking_params)
    redirect_to booking_path(booking)
  end

  def new
   @teacher = Teacher.find(params[:teacher_id])
   @booking = Booking.new
   authorize @booking
  end


 def approve
  set_booking
  authorize @booking
  @booking.approved!
  redirect_to bookings_path
end

def cancel
  set_booking
  authorize @booking
  @booking.cancelled!
  redirect_to bookings_path
end

def complete
  set_booking
  authorize @booking
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
    authorize @booking
    redirect_to booking_path(@booking)
  else
    render :new
  end
end

def destroy
  set_booking
  authorize @booking
  @booking.destroy
  redirect_to bookings_path
end

private

def set_booking
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

